# Use official Tomcat image as base
FROM tomcat:10.1.13-jdk17

# Maintainer info
LABEL maintainer="Lohith D <your-email@example.com>"

# Remove default webapps (optional, keeps container clean)
RUN rm -rf /usr/local/tomcat/webapps/*

# Set working directory
WORKDIR /usr/local/tomcat/webapps/

# Copy WAR file from target directory into Tomcat webapps
# Assumes WAR file is named vprofile.war after Maven build
COPY target/vprofile-v2.war ROOT.war

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
