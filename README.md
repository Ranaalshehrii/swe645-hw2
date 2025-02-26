# SWE645 HW2 - Frontend & Docker Setup

This repository contains the **frontend** of the **SWE645 HW2** assignment, which includes HTML files, images, and a Docker setup for running the application with **Tomcat**.

---

## Prerequisites

Before setting up this project, ensure you have the following tools installed:

- **Git**: For version control.
- **Maven**: To build and manage the project.
- **Docker**: To containerize and run the application.
- **Java**: Java 11 or later is required to run the application with Tomcat.

You can verify that these are installed using the following commands:

```
git --version
mvn --version
docker --version
java -version
```
--- 

## Project Structure
The project contains the following folder structure:

```
SWE645_HW2_StudentSurvey/
├── Dockerfile             # Docker configuration to run the app
├── pom.xml                # Maven configuration for the project
├── src/
│   └── main/
│       └── webapp/
│           ├── index.html  # Main homepage
│           ├── survey.html # Survey form
│           ├── images/     # Images for the frontend
│           └── WEB-INF/    # Web configurations for Tomcat
├── target/
│   └── SWE645_HW2_StudentSurvey.war # Packaged application file
```
---
## Setup Instructions
#### 1. Clone the repository:
To get started, clone this repository to your local machine:
```
git clone https://github.com/USERNAME/REPOSITORY_NAME.git
cd REPOSITORY_NAME
```

#### 2. Build the `.war` file:
Run the following command to build the project:
```
mvn clean package
```
This will generate a `.war` file under the target/ directory.


#### 3. Verify the `.war` file:
Ensure that the `.war` file was created successfully by checking the target folder:
```
ls target/
```
You should see the file `SWE645_HW2_StudentSurvey.war`.

---

## Running the Application Running with Docker
Once you've built the `.war` file, you can run the application in two ways: using Docker or directly with Tomcat.

#### 1. Build the Docker image:
Run the following command to build the Docker image for the application:
```
docker build -t swe645-hw2-studentsurvey:latest .
```

#### 2. Run the Docker container:
After building the image, run the application in a container:
```
docker run -d -p 8080:8080 swe645-hw2-studentsurvey:latest
```

#### 3.Access the application:
Open your web browser and go to the following URL to see the application running:

```
http://localhost:8080/StudentSurvey/survey.html
```
---

## Verifying the Application

Once you run the application, ensure the following pages are accessible:

- **Homepage**: `http://localhost:8080/StudentSurvey/` (index.html)
- **Survey Page**: `http://localhost:8080/StudentSurvey/survey.html`

The `survey.html` page should display the form that users can fill out.

---
## Docker Setup
If you decide to run the app using Docker, the `Dockerfile` provided in the project is configured to work with Tomcat 9.

### Dockerfile Content:

```
FROM tomcat:9.0-jdk15

# Copy the built WAR file into Tomcat's webapps directory
COPY target/SWE645_HW2_StudentSurvey.war /usr/local/tomcat/webapps/StudentSurvey.war

# Expose port 8080 for access
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
```
---
