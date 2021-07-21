# jupyter notebook
##  ~/../../Applications/VMD/VMD_1_9_3.app/Contents/MacOS/startup.command -dispdev text -eofexit < Createpsf_10Ab.tcl > output.log 
### Split the PDB file into segments and then create psf file
cd frames
set num 90
for {set x 1} {$x <= 10} {incr x} {
cd $x 	
package require psfgen
package require solvate
package require autoionize
topology ../../top_all36_prot.rtf
pdbalias residue HIS HSE   
pdbalias residue HID HSD   
pdbalias residue HIP HSP   
#
set filelist [glob frame_$num.pdb]
  foreach file $filelist {
    mol new $file
    set name [file rootname $file]
    set selp [atomselect top "not hetero"]
set chains [lsort -unique [$selp get pfrag]]
foreach chain $chains {
echo $chain
for {set i 0} {$i <= $chain} {incr i} {
set sel [atomselect top "pfrag $chain"]
#$sel writepdb $name-$chain.pdb
$sel writepdb Complex-$chain.pdb
pdbalias residue HIS HSP
pdbalias atom ILE CD1 CD
pdbalias atom LYS 1HZ HZ1
pdbalias atom LYS 2HZ HZ2
pdbalias atom LYS 3HZ HZ3
pdbalias atom ARG 1HH1 HH11
pdbalias atom ARG 2HH1 HH12
pdbalias atom ARG 1HH2 HH21
pdbalias atom ARG 2HH2 HH22
pdbalias atom ASN 1HD2 HD21
pdbalias atom ASN 2HD2 HD22
pdbalias atom SER HG HG1
pdbalias atom TYR H HN
pdbalias residue HIS HSE   
pdbalias residue HID HSD   
pdbalias residue HIP HSP 
pdbalias atom ILE H HN
pdbalias atom THR H HN
pdbalias atom SER H HN
pdbalias atom GLN H HN
pdbalias atom VAL H HN
pdbalias atom ARG H HN
pdbalias atom ASN H HN
pdbalias atom TYR H HN
pdbalias atom HIS H HN
pdbalias atom ASP H HN
pdbalias atom GLU H HN
pdbalias atom ALA H HN
pdbalias atom GLY O1 O
pdbalias atom GLY O2 O
pdbalias residue HIS HSD
pdbalias atom HSD CD1 CD
pdbalias atom ILE CD1 CD
resetpsf
}
}
}
segment U {pdb Complex-0.pdb} 	 
coordpdb Complex-0.pdb U 
segment U1 {pdb Complex-1.pdb} 	 
coordpdb Complex-1.pdb U1 
segment U2 {pdb Complex-2.pdb} 	 
coordpdb Complex-2.pdb U2  
#
guesscoord 
writepsf Complex_autopsf.psf
writepdb Complex_autopsf.pdb
resetpsf
incr num
cd ../
}
exit