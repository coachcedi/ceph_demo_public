# Use the official Ubuntu image as a base
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release \
	&& rm -rf /var/lib/apt/lists/* 

# Copy the setup script into the container
COPY setup.sh /usr/local/bin/setup.sh

COPY app /usr/local/bin/app

EXPOSE 8080
EXPOSE 5000

# Make the setup script executable
RUN chmod +x /usr/local/bin/setup.sh

# Execute the setup script
CMD ["/usr/local/bin/setup.sh"]

