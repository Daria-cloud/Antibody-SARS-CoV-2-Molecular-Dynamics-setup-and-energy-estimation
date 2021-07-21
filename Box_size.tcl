mol load psf solvated_ions.psf namdbin min/Antibody_min1.coor 
set sel [atomselect top all]
$sel writepdb solvated_ions_min.pdb
set coords [atomselect top all]
set minmax [measure minmax $coords]
set center_coor [measure center $coords]
set file [open "coor.txt" w]
puts $file $center_coor
close $file 
set file [open "coor_min_max.txt" w]
puts $file $minmax
close $file
exit

##  ~/../../Applications/VMD/VMD_1_9_3.app/Contents/MacOS/startup.command -dispdev text -eofexit < Solvate_ionize.tcl > out_solv.log 
mol load psf Complex_autopsf.psf namdbin min/Antibody_min.coor
set sel [atomselect top all]
$sel writepdb Min.pdb
