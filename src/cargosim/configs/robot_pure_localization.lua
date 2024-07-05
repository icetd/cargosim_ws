include "carto_localization.lua"

TRAJECTORY_BUILDER.pure_localization_trimmer = {
  max_submaps_to_keep = 3,
}
POSE_GRAPH.optimize_every_n_nodes = 35  --每35个有效帧组成一个子图，子图构建完成要闭环检测一次，这个数越小，闭环检测越频繁

return options
