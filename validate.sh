evo_traj kitti data0.txt  --ref=00_gt.txt -p --plot_mode=xz -as --save_results results_00/00_traj.zip
evo_ape kitti 00_gt.txt data0.txt  -va --plot --plot_mode xz -as --save_results results_00/00_ape.zip
evo_rpe kitti 00_gt.txt data0.txt  -va --plot --plot_mode xz -as --save_results results_00/00_rpe.zip

