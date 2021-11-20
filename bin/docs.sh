#!/bin/bash
set -e

mkdir -p .docs
modules=( "CabinetCoding" "CabinetCollections" "CabinetCore" "CabinetCrypto" "CabinetFoundation" "CabinetPartialTypes" "CabinetPropertyWrappers" "CabinetSwiftUI" )
docPaths=()
for module in "${modules[@]}"
do
    output=".docs/$module.json"
    sourcekitten doc --spm --module-name $module > $output
    docPaths+=($output)
done
docPathsJoined=${docPaths[*]}
docs=${docPathsJoined// /,}
bundle exec jazzy \
    --sourcekitten-sourcefile $docs \
    --author Philip Niedertscheider \
    --author_url https://github.com/philprime \
    --copyright '© 2021 [Philip Niedertscheider](https://philpri.me). All rights reserved.' \
    --github_url https://github.com/philprime/Cabinet \
    --theme fullwidth \
    --separate-global-declarations true \
    --use-safe-filenames true \
