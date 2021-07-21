#!/bin/bash
#
# 
cd "frames"
i=1
while [ $i -le 10 ]  #10
do
echo $i
cd $i
cp ../../minimization.txt .
mv frame_90_autopsf.pdb Complex_autopsf.pdb
mv frame_90_autopsf.psf Complex_autopsf.psf
mv frame_91_autopsf.pdb Complex_autopsf.pdb
mv frame_91_autopsf.psf Complex_autopsf.psf
mv frame_92_autopsf.pdb Complex_autopsf.pdb
mv frame_92_autopsf.psf Complex_autopsf.psf
mv frame_93_autopsf.pdb Complex_autopsf.pdb
mv frame_93_autopsf.psf Complex_autopsf.psf
mv frame_94_autopsf.pdb Complex_autopsf.pdb
mv frame_94_autopsf.psf Complex_autopsf.psf
mv frame_95_autopsf.pdb Complex_autopsf.pdb
mv frame_95_autopsf.psf Complex_autopsf.psf
mv frame_96_autopsf.pdb Complex_autopsf.pdb
mv frame_96_autopsf.psf Complex_autopsf.psf
mv frame_97_autopsf.pdb Complex_autopsf.pdb
mv frame_97_autopsf.psf Complex_autopsf.psf
mv frame_98_autopsf.pdb Complex_autopsf.pdb
mv frame_98_autopsf.psf Complex_autopsf.psf
mv frame_99_autopsf.pdb Complex_autopsf.pdb
mv frame_99_autopsf.psf Complex_autopsf.psf


~/science/MD/NAMD_2.13/namd2 +p 8 minimization.txt > min.log

cd ../
i=$(( $i + 1 ))
done
