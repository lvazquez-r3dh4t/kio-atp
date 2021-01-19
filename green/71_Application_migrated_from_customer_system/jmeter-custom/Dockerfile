FROM rhel7:latest

# Yum cleans and repolists are in place to be able to disable all repos and to allow the 
# "rhel-7-server-rpms" repo to be registered. Both actions will have no effect otherwise
# for reasons unkonwn
RUN yum clean all \
    && yum-config-manager --disable "*" 2>&1 > /dev/null\
    && yum repolist \
    && yum-config-manager --enable "rhel-7-server-rpms" --enable "rhel-7-server-thirdparty-oracle-java-rpms" \
    && yum repolist \
    && yum -y install java-1.8.0-openjdk\
    && yum clean all \
    && rm -rvf /var/cache/yum

LABEL io.k8s.description="JMeter standalone image" \
      io.k8s.display-name="JMeter standalone image 0.1.0" \
      io.openshift.tags=""

WORKDIR /opt/jmeter

RUN curl -o apache-jmeter-3.3.tgz -fL https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.3.tgz \
    && tar -zxvf apache-jmeter-3.3.tgz \
    && rm apache-jmeter-3.3.tgz \
    && chown -R 10001 . \
    && chmod -R a+rwX .
    
COPY ["run.sh", "test-case.jmx", "./"]

RUN chmod a+x run.sh \
    && mkdir output report \
    && chmod a+rwx output report

ENV TEST_FILE_PATH="test-case.jmx"\
    NO_ADD_HOSTNAME=""\
    OUTPUT_DIRECTORY="output"\
    REPORT_DIRECTORY="report"\
    WAIT_AFTER_COMPLETION="true"\
    PROPERTIES_PATH=""\
    JMETER_EXTRA_OPTIONS=""
    

USER 10001


CMD ["./run.sh"]


COPY activemq-all-5.11.0.redhat-630187.jar apache-jmeter-3.3/lib/

