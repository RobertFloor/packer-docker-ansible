FROM almalinux:9-minimal
RUN microdnf -y install java-11-openjdk-headless
RUN microdnf -y install python3 unzip procps-ng initscripts libaio python3-lxml python3-dnf
#RUN microdnf -y install prometheus-jmx-exporter

RUN mkdir -p /opt/amq /data /home/amq/.ansible/tmp/
#RUN mkdir /data
RUN useradd amq
RUN usermod -aG wheel amq
RUN chown -R amq:amq /opt/amq /data /home/amq/.ansible/tmp/

# USER amq
# COPY amq-broker-7.10.0-bin.zip /opt/amq/amq-broker-7.10.0-bin.zip
# RUN unzip /opt/amq/amq-broker-7.10.0-bin.zip -d /opt/amq
# RUN /opt/amq/amq-broker-7.10.0/bin/artemis create /opt/amq/amq-broker --user amq --password amq \
#                         --require-login --java-options "-Xms1024m -Xmx2048m" --data /data \
#                         --clustered  --cluster-user amq --cluster-password amq --shared-store --host localhost
# RUN sed -i 's/localhost/0.0.0.0/g' /opt/amq/amq-broker/etc/bootstrap.xml
# CMD /opt/amq/amq-broker/bin/artemis run