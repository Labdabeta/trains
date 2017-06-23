#include "track_data.h"
#include "path_finder.h"
#include "tasks.h"
#define PQ_CAPACITY 300
#include "pq.h"

#define track_index(expr) (expr - track)

static inline void dhelper(int dist, int * distance, int * prev, int n1, int n2, PriorityQueue* Q){
  if(dist < distance[n2]){
    distance[n2] = dist;
    prev[n2] = n1;
    pqInsert(Q, dist, n2);
  }
}

int Djikstra(PriorityQueue *Q, int *visited, int *distance, track_node *track, int source, int dest)
{
	for(int i = 0; i < TRACK_MAX; ++i){
		distance[i] = 1 << 30;
		visited[i] = 0;
	}

	distance[source] = 0;
	prev[source] = source;
	pqInsert(Q, 0, source);

	int n1, n2, dist;

	while(pqSize(Q)){
		n1 = pqGetMin(Q);

		if(n1 == dest){  // Terminate early
			dist = pqGetMinPriority(Q);
			while(pqSize(Q)){
				pqPop(Q);
			}
			return dist;
		}

		pqPop(Q);

		if(visited[n1])
			continue;
		visited[n1] = 1;

		switch(track[n1].type){
			case NODE_SENSOR:
			case NODE_MERGE:
				n2 = track_index(track[n1].edge[DIR_AHEAD].dest);
				dist = distance[n1] + track[n1].edge[DIR_AHEAD].dist;
				dhelper(dist, distance, prev, n1, n2, &Q);
			break;
			case NODE_BRANCH:
				n2 = track_index(track[n1].edge[DIR_STRAIGHT].dest);
				dist = distance[n1] + track[n1].edge[DIR_STRAIGHT].dist;
				dhelper(dist, distance, prev, n1, n2, &Q);
				n2 = track_index(track[n1].edge[DIR_CURVED].dest);
				dist = distance[n1] + track[n1].edge[DIR_CURVED].dist;
				dhelper(dist, distance, prev, n1, n2, &Q);
			break;
			default:
			break;
		}
	}
	return -1;
}

void path_finder(){
  Service();

  //Data for Djikstra
  track_node track[TRACK_MAX];
	init_tracka(track);
  int distance[TRACK_MAX];
  int visited[TRACK_MAX];
  int prev[TRACK_MAX];
	int successor[TRACK_MAX];
  PriorityQueue Q;
  pqInit(&Q);

	int maker_tid = CreateSize(0, path_maker, TASK_SIZE_SMALL);

	struct route_request request;
	struct path sensor_route;
	struct path_sw_pos switch_route;
  int caller;
	int n1;

  while(1){
		Receive(&caller, (char *) &request, sizeof(struct route_request));
		dprintf("Route request from %d to %d\n\r", request.source, request.dest);

		sensor_route.dist = Djikstra(&Q, visited, distance, track, request.source, request.dest);
		sensor_route.length = 0;
		switch_route.length = 0;

    if(!visited[request.dest]){
      dprintf("ERROR - PATH NOT FOUND\n\r");
    } else{
      n1 = request.dest;
			successor[request.dest] = -1;
			while(n1 != request.source){
				successor[prev[n1]] = n1;
				n1 = prev[n1];
			}

			n1 = request.source;
      while(n1 != -1){
        if(track[n1].type == NODE_BRANCH){
					switch_route.stations[switch_route.length] = track[n1].num;
					switch_route.positions[switch_route.length] =
						(successor[n1] == track_index(track[n1].edge[DIR_STRAIGHT].dest) ? 33 : 34;
					switch_route.length++;
        }
				if(track[n1].type == NODE_SENSOR || track[n1].type == NODE_ENTER || track[n1].type == NODE_EXIT){
					dprintf("Path: %s\n\r", track[n1].name);
					sensor_route.stations[sensor_route.length] = track[n1].name;
					sensor_route.length++;
				}
        n1 = successor[n1];
      }
			if(switch_route.length)
				Send(maker_tid, (char *) &switch_route, sizeof(struct path_sw_pos), 0, 0);
    }

		Reply(caller, (char *) &sensor_route, sizeof(struct path));
  }
}
