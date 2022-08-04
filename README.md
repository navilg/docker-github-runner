# docker-github-runner
Github runner in docker

# Add a new runner

- Get token from Github repo. Go to repo --> Settings --> Actions --> Runners --> New self-hosted runner
- Run below command to add runner

```
docker run -it --rm -e GHR_NAME=RUNNER-NAME -e GHR_LABELS=LABEL1,LABEL2 -e GHR_URL=https://github.com/USERNAME/REPONAME -e GHR_TOKEN=TOKEN -v /var/run/docket.sock:/var/run/docker.sock linuxshots/github-runner:2.294.0-0
```
