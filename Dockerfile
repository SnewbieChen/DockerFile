FROM centos

RUN yum makecache && yum install -y dhcp which iproute net-tools && yum clean all && \
    mkdir /dhcp

WORKDIR /dhcp

CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/dhcp/dhcpd.conf", "eth0"]
