cd frames
i=1
while [ $i -lt 11 ]
do
echo $i
mkdir $i
mv frame_90.pdb 1/"frame_90.pdb"
mv frame_91.pdb 2/"frame_91.pdb"
mv frame_92.pdb 3/"frame_92.pdb"
mv frame_93.pdb 4/"frame_93.pdb"
mv frame_94.pdb 5/"frame_94.pdb"
mv frame_95.pdb 6/"frame_95.pdb"
mv frame_96.pdb 7/"frame_96.pdb"
mv frame_97.pdb 8/"frame_97.pdb"
mv frame_98.pdb 9/"frame_98.pdb"
mv frame_99.pdb 10/"frame_99.pdb"
i=$(( $i + 1 ))
done
# In VMD create psf