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

void path_finder(){
  Service();

  //Data for Djikstra
  track_node track[TRACK_MAX];
	init_tracka(track);
  int distance[TRACK_MAX];
  int visited[TRACK_MAX];
  int prev[TRACK_MAX];
	int sucess[TRACK_MAX];
  PriorityQueue Q;
  pqInit(&Q);
  int n1, n2, dist;

	struct route_request request;
  int caller;
  int clock_tid = WhoIs("CLOCK");

  while(1){
		Receive(&caller, (char *) &request, sizeof(struct route_request));
		dprintf("Route request from %d to %d\n\r", request.source, request.dest);
    for(int i = 0; i < TRACK_MAX; ++i){
      distance[i] = 1 << 30;
      visited[i] = 0;
    }
    distance[request.source] = 0;
    prev[request.source] = request.source;
    pqInsert(&Q, 0, request.source);

    //Djikstra's algorithm
    while(pqSize(&Q)){
      n1 = pqGetMin(&Q);
      pqPop(&Q);

      if(visited[n1])
        continue;
      visited[n1] = 1;

      if(n1 == request.dest) // Terminate early
        break;
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

    if(!visited[request.dest]){
      dprintf("FATAL ERROR - PATH NOT FOUND\n\r");
    } else{
      n1 = request.dest;
			sucess[request.dest] = request.dest;
			while(n1 != request.source){
				sucess[prev[n1]] = n1;
				n1 = prev[n1];
			}

			n1 = request.source;
      while(n1 != request.dest){
        if(track[n1].type == NODE_BRANCH){
          if(sucess[n1] == track_index(track[n1].edge[DIR_STRAIGHT].dest)){
            tput2(33, track[n1].num);
          	Delay(clock_tid, 10);
          	tputc(32);
          } else{
            tput2(34, track[n1].num);
          	Delay(clock_tid, 10);
          	tputc(32);
          }
        }
				if(track[n1].type == NODE_SENSOR || track[n1].type == NODE_ENTER || track[n1].type == NODE_EXIT){
					dprintf("Path: %s\n\r", track[n1].name);
				}
        n1 = sucess[n1];
      }
			dprintf("Path: %s\n\r", track[n1].name);
    }
		Reply(caller, 0, 0);
  }
}
