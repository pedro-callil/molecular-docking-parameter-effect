#! /bin/bash

testing_root_dir="$(git rev-parse --show-toplevel)/files_for_docking/"
testing_dirs=$(ls $testing_root_dir)

for system in $testing_dirs;
do
	cd "$testing_root_dir/$system"
	echo "Now adding charges to system $system"
	for charge in {none,mmff94,gasteiger};
	do
		echo "obabel ${system}_protein_prep.pdb -h --partialcharge $charge -xrh -O  ${system}_receptor_${charge}_hydrogen.pdbqt"
		echo "obabel ${system}_protein_prep.pdb -d --partialcharge $charge -xr -O  ${system}_receptor_${charge}_hydrogen.pdbqt"
		echo "obabel ${system}_ligand.sdf --partialcharge $charge -xh -O  ${system}_ligand_${charge}_hydrogen_.pdbqt"
	done
done
