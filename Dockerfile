FROM node:9

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan gitlab.example.com > /root/.ssh/known_hosts
    
ADD keys/id_rsa /root/.ssh/id_rsa
ADD keys/id_rsa.pub /root/.ssh/id_rsa.pub

# Add the keys and set permissions
RUN chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub

WORKDIR /opt

#RUN git clone https://github.com/ldziedziul/timeoff-management.git timeoff-management
RUN git clone git@gitlab.example.com/timeoff.git timeoff-management

WORKDIR /opt/timeoff-management
RUN npm install

EXPOSE 3000
VOLUME /opt/timeoff-management/config
ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "bash", "/docker-entrypoint.sh"]
