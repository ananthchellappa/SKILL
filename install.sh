#!/bin/bash -eu
# -e : exit on error; -u : error on usage of undefined var; -x : print line prior to execution

# assumes that install.sh is located in the directory we want to copy over to ~/SKILL

src=$(realpath $0 | perl -p -e 's#/[^/]+$##')
echo `dirname $src`
target=$(basename $src )
echo $target

cd
if [ $PWD == `dirname $src` ] ; then
	echo blue on blue. Nothing to do. goodbye
	exit
fi


if [ -f .cdsenv ] ; then
        mv .cdsenv .cdsenv.bak_`date +"%m_%d_%y"`       # save old if it exists
fi
cp $src/dotfiles/.cdsenv .  # copy


if [ -f .cdsinit ] ; then
		mv .cdsinit .cdsinit.bak_`date +"%m_%d_%y"`
fi
cp $src/dotfiles/.cdsinit .	

perl -p -i -e 'BEGIN{$user = `whoami`; chomp($user)}s/USERNAME/$user/g;' .cdsinit 


if [ -d $target ] ; then
		mv $target ${target}_bak_`date +"%m_%d_%y"`
fi
cp -r $src .
find $target -name '*.il' | xargs perl -pi -e 'BEGIN{$u=whoami;chomp $u}s/USERNAME/$u/g;'

echo "!!! Check if you need to link a .cdsinit-user or .cdsinit.user or .cdsinit from your proj directory to your ~/.cdsinit"
echo '!!! One option is to add loadi "~/.cdsinit" in one of those project-directory files'
echo "!!! Use $ cat .cdsenv.bak_"`date +"%m_%d_%y"` '>> .cdsenv to keep your old settings'
echo "!!! same for your .cdsinit"

