# Software Engineering / Tools / GitLab

## Useful Jobs

### Job to bump version



```yaml
to github:
  only: ["master"]
  stage: publish
  image: usvc/semver:gitlab-latest
  before_script:
    - if [ "${BASE64_DEPLOY_KEY}" = "" ]; then
        exit 1;
      else
        mkdir -p ~/.ssh;
        printf -- "${BASE64_DEPLOY_KEY}" | base64 -d > ~/.ssh/id_rsa;
        chmod 600 -R ~/.ssh/id_rsa;
        ssh-keyscan -t rsa ${REPO_HOSTNAME} >> ~/.ssh/known_hosts;
      fi;
  script:
    - git config --global user.email "${GITLAB_USER_EMAIL}"
    - git config --global user.name "${GITLAB_USER_NAME}"
    - git remote set-url --add --push origin ${REPO_URL}
    - git checkout master
    - git push -u origin master --tags --force
  after_script:
    - rm -rf ~/.ssh/*
```