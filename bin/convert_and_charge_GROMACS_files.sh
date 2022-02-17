#! /bin/bash

# This file converts GROMACS output files to PDB files.

# Function to fix chain identifiers in the PDB
function split_in_list () {
	if [ "$#" == "3" ];
	then
		cat $1 | sed -e "$2,$3s/ A / B /"
	elif [ "$#" == "4" ];
	then
		cat $1 | sed -e "$2,$3s/ A / B /" | \
			sed -e "$3,$4s/ A / C /"
	elif [ "$#" == "5" ];
	then
		cat $1 | sed -e "$2,$3s/ A / B /" | \
			sed -e "$3,$4s/ A / C /" | \
			sed -e "$4,$5s/ A / D /"
	else
		cat $1
	fi
}

top=$(git rev-parse --show-toplevel)

list_of_dirs=$(ls $top/GROMACS | \
	grep -v gro | \
	grep -v READ)

for dir in $list_of_dirs;
do
	rm -rf $top/GROMACS/gro_correction_and_charges/$dir
	mkdir -p $top/GROMACS/gro_correction_and_charges/$dir
	cp $top/GROMACS/{,gro_correction_and_charges/}$dir/md_2_0.gro
	cp $top/GROMACS/{,gro_correction_and_charges/}$dir/$(echo $dir | \
		tr '[a-z]' '[A-Z]')_original.pdb
	cd $top/GROMACS/gro_correction_and_charges/$dir
	cat md_2_0.gro | grep -v 'CLA' | \
		grep -v 'CL ' | \
		grep -v 'NA ' | \
		grep -v 'SOL' > md_2_0_wrong_no.gro
	n_of_lines=$(cat md_2_0_wrong_no.gro | \
		tail -n 2 | head -n 1 | \
		sed -e "s/\ \+/*/g" | \
		cut -d '*' -f 4)
	cat md_2_0_wrong_no.gro | \
		sed -e "2s/[0-9]\+/$n_of_lines/g" | \
		perl -pe 's/(\d+)([A-Z])/($1+1) . $2/e' | \
		sed -e 's/^\(\ \+\)\ 10/\110/'> $dir.gro
	obabel $dir.gro -O ${dir}_wrongseq.pdb
	list=$(cat ${dir}_wrongseq.pdb | \
		grep -n ATOM | \
		sed -e 's/\ \+/:/g' | \
		cut -d ':' -f 1,7)
	residue_in_chain_old=1
	must_cut=$( ( for line in $list;
	do
		residue_in_chain=$(echo $line | cut -d ':'  -f 2)
		if [ "$residue_in_chain" -lt "$residue_in_chain_old" ];
		then
			echo $line
		fi
		residue_in_chain_old=$residue_in_chain
	done && echo $line ) | cut -d ':' -f 1)
	split_in_list ${dir}_wrongseq.pdb $must_cut > $dir.pdb
done

