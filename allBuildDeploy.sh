#!/usr/bin/env bash
cliDir="/e/open/axj/axj-cli"

cd `dirname $0`
args=$*

if [[ -z "$args" ]] || [[ $args =~ "2" ]];then
pnpm install
pnpm run build
$cliDir/mnt/mng/vv.sh dist/vv.txt
fi

if [[ $args =~ "3" ]];then
	rm -rf publish.tar.gz
	tar -zcvf publish.tar.gz dist
    $cliDir/mnt/mng/deployMng.sh da-assets-web publish.tar.gz /opt/mng test-1
fi