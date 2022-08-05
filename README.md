# docker-github-runner
Github runner in docker

# Add a new runner

- Get token from Github repo. Go to repo --> Settings --> Actions --> Runners --> New self-hosted runner
- Run below command to add runner

```
docker run --name github-runner -d -e GHR_NAME=RUNNER-NAME -e GHR_LABELS=LABEL1,LABEL2 -e GHR_URL=https://github.com/USERNAME/REPONAME -e GHR_TOKEN=TOKEN -e GHR_DOCKERGID=GID-OF-DOCKER-GROUP -v actions-runner:/runner/actions-runner -v /var/run/docket.sock:/var/run/docker.sock linuxshots/github-runner:2.294.0-0
```

e.g.

```
docker run --name github-runner -d -e GHR_NAME=gddns -e GHR_LABELS=prod,production -e GHR_URL=https://github.com/navilg/docker-github-runner -e GHR_TOKEN=AI53ABCDIUAK7YLCABCD7RDC5ABC1 -v /var/run/docker.sock:/var/run/docker.sock -v actions-runner:/runner/actions-runner -e GHR_DOCKERGID=998 linuxshots/github-runner:2.294.0-0
```