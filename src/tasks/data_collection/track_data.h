#ifndef TDATA_H
#define TDATA_H

typedef enum {
  NODE_NONE,
  NODE_SENSOR,
  NODE_BRANCH,
  NODE_MERGE,
  NODE_ENTER,
  NODE_EXIT,
} node_type;

#define DIR_AHEAD 0
#define DIR_STRAIGHT 0
#define DIR_CURVED 1

struct track_node;
typedef struct track_node track_node;
typedef struct track_edge track_edge;

struct track_edge {
  track_edge *reverse;
  track_node *src, *dest;
  int dist;
};

struct track_node {
  const char *name;
  node_type type;
  int num;
  track_node *reverse;
  track_edge edge[2];
};

#define TRACK_MAX 144

void init_tracka(track_node *track);
void init_trackb(track_node *track);

#endif
