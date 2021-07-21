# jupyter notebook
##  ~/../../Applications/VMD/VMD_1_9_3.app/Contents/MacOS/startup.command -dispdev text -eofexit < Save_pdb.tcl > output.log 
### Split the PDB file into segments and then create psf file
cd frames
for {set i 1} {$i < 11} {incr i} {
cd $i
mol load psf Complex_autopsf.psf namdbin Antibody_min.coor
set sel [atomselect top all]
$sel writepdb Min.pdb
resetpsf
cd ../
}
exit