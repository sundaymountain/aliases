#!/bin/bash
read -rp "GitHub username: " username
read -rp "Repository name: " reponame
read -rsp "Personal access token: " token
echo
[[ "$reponame" != *.git ]] && reponame="${reponame}.git"
url="https://${token}@github.com/${username}/${reponame}"
git remote add origin "$url"
echo "Remote 'origin' added successfully."
