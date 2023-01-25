#! /bin/bash


root_dir="$(git rev-parse --show-toplevel)"

cd $root_dir

cd shared_receptors

for dir in $(ls | grep -v "groups.txt"); do
	list=$(cat $dir/results.txt | cut -d ' ' -f 1 | sort | uniq)
	vals="$(awk '{ print $2 " " $1 " " $3}' $dir/results.txt)"
	for ligand in $list; do
		vals_ligand="$(echo "$vals" | grep ^$ligand)"
		vals_same="$(echo "$vals_ligand" | \
			cut -d ' ' -f 2- | \
			grep ^$ligand | \
			cut -d ' ' -f 2)"
		vals_diff="$(echo "$vals_ligand" | \
			cut -d ' ' -f 2- | \
			grep -v ^$ligand | \
			cut -d ' ' -f 2)"
		for val_diff in $vals_diff; do
			echo "scale=10; $val_diff - $vals_same" | bc -l
		done
	done
done


