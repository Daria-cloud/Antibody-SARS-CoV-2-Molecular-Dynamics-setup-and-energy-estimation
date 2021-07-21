##  ~/../../Applications/VMD/VMD_1_9_3.app/Contents/MacOS/startup.command -dispdev text -eofexit < Process_traj.tcl > out_tr.log 
mol new solvated_ions.psf 
animate read dcd md.dcd
mkdir frames 
for {set i 90} {$i < 100} {incr i} {
  set sel [atomselect top "not water and not ions" frame $i] 
  $sel writepdb frames/frame_$i.pdb
  $sel delete
} 
exit