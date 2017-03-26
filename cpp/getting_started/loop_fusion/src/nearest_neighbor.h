#define NUM_DIMS 2
#define NUM_POINTS 512

#pragma SDS data zero_copy(out, points, search_point)
void nearest_neighbor_loop_fusion_accel(int out[NUM_DIMS], const int points[NUM_POINTS * NUM_DIMS],
                       const int search_point[NUM_DIMS], const int len,
                       const int dim);
