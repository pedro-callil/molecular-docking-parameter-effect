#! /bin/bash

# This script creates a directory and fills it with all receptor-ligand
# pairs to which charges and hydrogens atoms were successfully added/removed.

max_sims_ok=7 # 7 different charge models considered; EQEq discarded
testing_root_dir="$(git rev-parse --show-toplevel)/files_from_rcsb/original_files_and_defaults/"
ligand_dir="$(git rev-parse --show-toplevel)/files_for_charge_comparison/"
charge_root_dir="$(git rev-parse --show-toplevel)/files_for_rcsb_charge_comparison/original_files_and_defaults/"

if [ ! -d $charge_root_dir ];
then
	mkdir -p $charge_root_dir
else
	rm -rf $charge_root_dir && mkdir -p $charge_root_dir
fi

for dir in $testing_root_dir/*;
do
	sims_ok=$(du $dir/*.pdbqt | grep -v ^0 | wc -l)
	if [ "$sims_ok" == "$max_sims_ok" ];
	then
		mkdir $charge_root_dir$(basename $dir)
		for file in $dir/*.pdbqt;
		do
			cp $file $charge_root_dir$(basename $dir)
		done
		cp $ligand_dir$(basename $dir)/grid.conf $charge_root_dir$(basename $dir)
		for ligand in $ligand_dir$(basename $dir)/ligand_*;
		do
			cp $ligand $charge_root_dir$(basename $dir)/$(basename $ligand)
		done
	fi
done

