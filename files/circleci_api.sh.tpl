CCI_TOKEN=${cci_token}
VCS_TYPE=${vcs}
USERNAME=${github_org}
PROJECT=${git_repo}
OAUTH_TOKEN=${github_token}

curl https://api.github.com/repos/$USERNAME/$PROJECT/branches/master?access_token=$OAUTH_TOKEN > ./repo.log

while grep -m1 'Not Found' < ./repo.log; do
  echo "#######################################"
  echo "Waiting for repo to be created"
  sleep 10
  curl https://api.github.com/repos/$USERNAME/$PROJECT/branches/master?access_token=$OAUTH_TOKEN > ./repo.log
  cat ./repo.log
done


echo "###########################"
echo "Looks like we can start now"

curl -X POST  https://circleci.com/api/v1.1/project/$VCS_TYPE/$USERNAME/$PROJECT/follow?circle-token=$CCI_TOKEN
curl -X POST --header "Content-Type: application/json" -d '{"type":"github-user-key"}' https://circleci.com/api/v1.1/project/$VCS_TYPE/$USERNAME/$PROJECT/checkout-key?circle-token=$CCI_TOKEN
