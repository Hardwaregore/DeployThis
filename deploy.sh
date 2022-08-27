#!/bin/bash

if [[ -z "${serverLocation_ENV}" ]]; then
  echo "Please set the serverLocation_ENV envoirment variable"
  exit
else
  serverLocation="${serverLocation_ENV}"
fi

if [[ -z "${sshUser_ENV}" ]]; then
  echo "Please set the sshUser_ENV envoirment variable"
  exit
else
  sshUser="${sshUser_ENV}"
fi


if [[ -z "${repo_ENV}" ]]; then
  echo "Please set the repo_ENV envoirment variable"
  exit
else
  repo="${repo_ENV}"
fi


if [[ -z "${wsPath_ENV}" ]]; then
  echo "Please set the wsPath_ENV envoirment variable"
  exit
else
  wsPath="${wsPath_ENV}"
fi

git add .

git commit -m $1

git push

ssh -t $sshUser@$serverLocation "git clone $repo; cd repo; mv * $wsPath; rm -rf $(pwd); echo 'SECCESS'"
