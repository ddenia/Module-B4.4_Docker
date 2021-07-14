FROM ubuntu:20.10

# Install required dependencies
RUN apt-get update &&  apt-get upgrade -y && apt-get install -y \
	nano \
	vim \
	net-tools \
	curl \
	nginx

RUN adduser --quiet --disabled-password --shell /bin/bash --home $HOME --gecos '' site && \
    echo "site:password" | chpasswd && \
    adduser site sudo

RUN mkdir -p /var/log/nginx/ && mkdir -p /var/lib/nginx/

#COPY nginx.conf /etc/nginx/nginx.conf

#USER site

WORKDIR /home/site

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
