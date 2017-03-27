#ifndef NEAREST_NEIGHBOR_H_
#define NEAREST_NEIGHBOR_H_

#define NUM_DIMS 2
#define NUM_POINTS 512

#pragma SDS data zero_copy(out, points, search_point)
void nearest_neighbor_loop_fusion_accel(int *out, const int *points,
                       const int *search_point, const int len,
                       const int dim);
#endif
