FROM quay.io/artemiscloud/activemq-artemis-broker-init:0.2.3

ADD mysql-jdbc-driver /amq/mysql-jdbc-driver
# Include custom configuration file 'post-config.sh'
ADD bin /amq/scripts

RUN ls /amq
RUN ls /amq/scripts

