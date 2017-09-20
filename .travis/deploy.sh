#!/bin/bash
function abort(){
    echo "The deploy process is failed" 1>&2
    exit 1
}

trap 'abort' 0

openssl aes-256-cbc -d -a -in ubuntu.pem.enc -out ubuntu.pem -k $DEC_PASSWD

eval "$(ssh-agent -s)"
chmod 400 ubuntu.pem

ssh-add ubuntu.pem
rsync -r ./_site/ ubuntu@52.76.173.135:/var/content/blog

rm -rf _site/
rm Gemfile.lock
rm -rf .sass-cache/

chmod 644 ubuntu.pem
rm ubuntu.pem

trap : 0