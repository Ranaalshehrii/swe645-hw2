FROM tomcat:9.0-jdk15

# Copy the built WAR file into Tomcat's webapps directory
COPY target/SWE645_HW2_StudentSurvey.war /usr/local/tomcat/webapps/StudentSurvey.war

# Expose port 8080 for access
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
