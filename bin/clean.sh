#! /bin/bash

root_dir="$(git rev-parse --show-toplevel)"

rm -rf "${root_dir}/files_for_docking"

cp -r "${root_dir}/original_files" "${root_dir}/files_for_docking"
