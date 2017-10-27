#!/bin/bash
function abort(){
    echo "The deploy process is failed" 1>&2
    exit 1
}

trap 'abort' 0

source "https://rubygems.org"

gem "jekyll"
gem "html-proofer"

trap : 0
