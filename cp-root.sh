#!/bin/bash



copy_files() {
cat <<EOF
build_amami.sh
build_falcon.sh
build_gts210ltexx.sh
build_osprey.sh
make_clean.sh
switch_microG.sh
EOF
}


copy_files | while read FILE; do
    cp "$FILE" ../../
done

