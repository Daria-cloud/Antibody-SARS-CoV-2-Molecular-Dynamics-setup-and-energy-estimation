#!/bin/bash
#
#while read id
#do
id=your_folder_name
echo $id
cd $id
cd "frames"
	i=1
	while [ $i -lt 11 ]	# -lt 11
	do
		echo $i
		cd $i
		mkdir Energy2
		awk '$1 ~ /ATOM/ && $5 ~ /H/ { print $0}' Min.pdb > ligand1.pdb
		awk '$6 < 127 { print $0}' ligand1.pdb > ligand.pdb
		awk '$1 ~ /ATOM/ && $5 ~ /L/ { print $0}' Min.pdb > Energy2/ligand2.pdb 
		awk '$6 < 110 { print $0}' Energy2/ligand2.pdb > Energy2/ligand.pdb
		rm Energy2/ligand2.pdb
		rm ligand1.pdb
		awk '$1 ~ /ATOM/ && $5 ~ /B/ { print $0}' Min.pdb > protein.pdb
		cp protein.pdb Energy2/protein.pdb

# Energy
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py -r protein.pdb 
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py -r ligand.pdb
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_ligand4.py -l ligand.pdbqt -C -Z
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_gpf4.py -l ligand.pdbqt -r protein.pdbqt -y
sed 's/spacing 0.375                        # spacing(A)/spacing 0.5/g' protein.gpf > protein1.gpf
/Applications/MGLTools-1.5.7rc1/autogrid4 -p protein1.gpf
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_dpf4.py -l ligand.pdbqt -r protein.pdbqt
sed '/tran0 random/,$d' ligand_protein.dpf > ligand_protein1.dpf
echo epdb >> ligand_protein1.dpf

/Applications/MGLTools-1.5.7rc1/autodock4 -p ligand_protein1.dpf -l scoring_result.log
 
chainH=`grep 'epdb: USER    (1) Final Intermolecular Energy     =' scoring_result.log | awk '{print $8}' `
#		
	cd Energy2
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py -r protein.pdb 
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py -r ligand.pdb
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_ligand4.py -l ligand.pdbqt -C -Z
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_gpf4.py -l ligand.pdbqt -r protein.pdbqt -y
sed 's/spacing 0.375                        # spacing(A)/spacing 0.5/g' protein.gpf > protein1.gpf
/Applications/MGLTools-1.5.7rc1/autogrid4 -p protein1.gpf
/Library/MGLTools/1.5.7rc1/bin/pythonsh /Library/MGLTools/1.5.7rc1/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_dpf4.py -l ligand.pdbqt -r protein.pdbqt
sed '/tran0 random/,$d' ligand_protein.dpf > ligand_protein1.dpf
echo epdb >> ligand_protein1.dpf
/Applications/MGLTools-1.5.7rc1/autodock4 -p ligand_protein1.dpf -l scoring_result.log	
chainK=`grep 'epdb: USER    (1) Final Intermolecular Energy     =' scoring_result.log | awk '{print $8}'`
    cd ../  # from Energy2	
	cd ../
	echo $id" frame_"$i" "$chainH" "$chainK >> ../../energy.txt
	i=$(( $i + 1 ))	
	done
