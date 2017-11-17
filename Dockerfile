FROM  java

MAINTAINER mc.kj

COPY lib/liquibase-3.5.3-bin.tar.gz /tmp/liquibase-3.5.3-bin.tar.gz

RUN mkdir /opt/liquibase

RUN tar -xzf /tmp/liquibase-3.5.3-bin.tar.gz -C /opt/liquibase
RUN chmod +x /opt/liquibase/liquibase
RUN ln -s /opt/liquibase/liquibase /usr/local/bin/

COPY lib/mysql-connector-java-5.1.44-bin.jar /opt/jdbc_drivers/
RUN ln -s /opt/jdbc_drivers/mysql-connector-java-5.1.44-bin.jar /usr/local/bin/

ADD bin /bin
RUN chmod -R +x /bin

ENTRYPOINT ["/bin/bash"]