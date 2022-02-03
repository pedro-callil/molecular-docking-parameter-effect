#! /bin/bash

root_dir="$(git rev-parse --show-toplevel)"

cp -r "${root_dir}/original_files" "${root_dir}/files_for_docking"
