#!/bin/bash
if ! git clone git@github.com:AdobeAtAdobe/aem-6_1-base.git; then
    echo "No big deal.  If you want you can go into that dir and just do a git pull if you need/want to update the project"
fi

if ! git clone git@github.com:AdobeAtAdobe/aem-6_1-publish.git; then
    echo "No big deal.  If you want you can go into that dir and just do a git pull if you need/want to update the project"
fi

if ! git clone git@github.com:AdobeAtAdobe/aem-6_1-author.git; then
    echo "No big deal.  If you want you can go into that dir and just do a git pull if you need/want to update the project"
fi

if ! git clone git@github.com:AdobeAtAdobe/aem-6_1-dispatcher-publish.git; then
    echo "No big deal.  If you want you can go into that dir and just do a git pull if you need/want to update the project"
fi

if ! git clone git@github.com:AdobeAtAdobe/aem-6_1-composedev.git; then
    echo "No big deal.  If you want you can go into that dir and just do a git pull if you need/want to update the project"
fi

sh -c 'cd aem-6_1-base/ && exec docker build -t dbenge/aem-6_1-base .'
echo "done building Base image"

while true; do
	echo "Put your AEM jar and your license file in aem-6_1-publish/resources directory."
    read -p "When ready type y and hit enter?" y
    case $y in
        [Yy]* ) break;;
        * ) echo "Please answer y when your ready to move foward.";;
    esac
done

sh -c 'cd aem-6_1-publish/ && exec docker build -t aem_6-1_publish .'
echo "done building Publisher"

while true; do
	echo "Put your AEM jar and your license file in aem-6_1-author/resources directory."
    read -p "When ready type y and hit enter?" y
    case $y in
        [Yy]* ) break;;
        * ) echo "Please answer y when your ready to move foward.";;
    esac
done

sh -c 'cd aem-6_1-author/ && exec docker build -t aem_6-1_author .'
echo "done building Author"

sh -c 'cd aem-6_1-dispatcher-publish/ && exec docker build -t dispatcher_4-1-9 .'
echo "done building Dispatcher"

sh -c 'cd aem-6_1-composedev'
echo 'Now go into aem-6_1-composedev and run docker-compose up -d'