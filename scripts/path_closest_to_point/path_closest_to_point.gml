///@arg path
///@arg x
///@arg y
///@arg intervals
// Return a 3-entry array with the x and y coordinates of the point, plus the position in [0, 1] of the path where it happens
{
var path = argument0,
    xx = argument1,
    yy = argument2,
    n = argument3,
    result, best_dist, current_dist, current_x, current_y, current_pos;
// Default result: End of path
result[0] = path_get_x(path, 1);
result[1] = path_get_y(path, 1);
result[2] = 1;
best_dist = point_distance(xx, yy, result[0], result[1]);
// Sample the path
for (var i = 0; i < n; i++) {
  current_pos = i/n;
  current_x = path_get_x(path, current_pos);
  current_y = path_get_y(path, current_pos);
  current_dist = point_distance(xx, yy, current_x, current_y);
  // Replace the result if the current point is better
  if  (current_dist < best_dist) {
    result[0] = current_x;
    result[1] = current_y;
    result[2] = current_pos;
    best_dist = current_dist;
  }
}
// Done
return result;
}