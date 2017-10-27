#!/bin/bash
function abort(){
    echo "The deploy process is failed" 1>&2
    exit 1
}

trap 'abort' 0



gem install jekyll -v 3.5.2
gem install html-proofer

bundle exec jekyll build

echo "list gem again"
gem list
trap : 0
