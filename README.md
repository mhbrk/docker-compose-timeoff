# docker-compose-timeoff
TimeOff.Management service in docker-compose with own repository

### run
* fork https://github.com/timeoff-management/application to own repository: gitlab.example.com/timeoff
* generate ssh keys via ssh-keygen (id_rsa.pub and id_rsa) and move to folder `keys`
* add `id_rsa.pub` to https://gitlab.example.com/admin/deploy_keys, and enable it for your project
* 
  ```
  cd /srv/docker/timeoff
  git clone git@gitlab.example.com:timeoff.git .
  docker-compose up -d --build
  ```
* 

## thanks 
* https://github.com/timeoff-management/application
* https://github.com/ldziedziul/timeoff-management-docker-compose
* https://github.com/thomasleveil/docker-sqliteweb
