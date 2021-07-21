##  ~/../../Applications/VMD/VMD_1_9_3.app/Contents/MacOS/startup.command -dispdev text -eofexit < Solvate_ionize.tcl > out_solv.log 
mol load psf Complex_autopsf.psf namdbin min/Antibody_min.coor
set sel [atomselect top all]
$sel writepdb Min.pdb
#
mol load psf Complex_autopsf.psf pdb Min.pdb
package require solvate
solvate Complex_autopsf.psf Min.pdb -t 10 -o solvated
package require autoionize
autoionize -psf solvated.psf -pdb solvated.pdb -sc 0.15 -cation SOD -anion CLA -o solvated_ions
exit