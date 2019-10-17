FROM integralsw/osa-python
ARG REPO_PATH=./repo
ENV PIP_CONFIG_FILE=/etc/pip/pip.conf
ADD $REPO_PATH/pip.conf /etc/pip/pip.conf
ADD $REPO_PATH/requirements.txt /requirements.txt
RUN mkdir -pv /home/oda; export HOME_OVERRRIDE=/home/oda; source /init.sh;  pip install --upgrade pip
RUN mkdir -pv /home/oda; export HOME_OVERRRIDE=/home/oda; source /init.sh;  pip install -r /requirements.txt
ADD $REPO_PATH /repo
RUN mkdir -pv /home/oda; export HOME_OVERRRIDE=/home/oda; source /init.sh;  touch /repo-hash-23bcb445e5b385f9a1d643aca9e3e9c1; pip install -r /repo/requirements.txt
RUN useradd -ms /bin/bash oda
ARG nb2workflow_revision
RUN mkdir -pv /home/oda; export HOME_OVERRRIDE=/home/oda; source /init.sh;  git clone https://github.com/volodymyrss/nb2workflow.git /nb2workflow; cd /nb2workflow; git reset --hard $nb2workflow_revision; pip install -r requirements.txt; pip install .; rm -rf /nb2workflow
USER oda
WORKDIR /workdir
