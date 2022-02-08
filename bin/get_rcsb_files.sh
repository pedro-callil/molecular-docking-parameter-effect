#! /bin/bash

# This script downloads files from the RCSB database.

testing_root_dir="$(git rev-parse --show-toplevel)/files_for_charge_comparison/"
new_dir="$(git rev-parse --show-toplevel)/files_from_rcsb/"
testing_dirs=$(ls $testing_root_dir)

if [ ! -d "$new_dir" ];
then
	mkdir $new_dir
else
	rm -rf $new_dir/*
fi

for dir in $testing_dirs;
do
	mkdir $new_dir/$dir
	curl "https://files.rcsb.org/download/$dir.pdb" > $new_dir/$dir/original.pdb
done

