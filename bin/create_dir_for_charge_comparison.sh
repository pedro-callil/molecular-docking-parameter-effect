#! /bin/bash

max_sims_ok=21 # 7 different charge models considered; EQEq discarded
testing_root_dir="$(git rev-parse --show-toplevel)/files_for_docking/"
charge_root_dir="$(git rev-parse --show-toplevel)/files_for_charge_comparison/"

if [ ! -d $charge_root_dir ];
then
	mkdir $charge_root_dir
else
	rm -rf $charge_root_dir && mkdir $charge_root_dir
fi

for dir in $testing_root_dir/*;
do
	sims_ok=$(du $dir/*.pdbqt | grep -v eqeq | grep -v ^0 | wc -l)
	if [ "$sims_ok" == "$max_sims_ok" ];
	then
		cp -r $dir $charge_root_dir
	fi
done

