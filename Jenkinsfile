pipeline {
    agent any
    environment {
        // Your Docker Hub repository where your image is stored
        DOCKERHUB_REPO = "ranaalshehri/swe645-hw2-student-survey-amd64"
        // Credentials saved in Jenkins with the ID "docker-pass"
        DOCKERHUB_CREDENTIALS = credentials('docker-pass')
        // Optionally define your Kubernetes namespace (default in this example)
        K8S_NAMESPACE = "default"
    }
    stages {
        stage('Checkout') {
            steps {
                // Automatically checks out the repository configured in the job
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build the Docker image and tag it with 'latest'
                sh "docker build -t ${DOCKERHUB_REPO}:latest ."
            }
        }
        stage('Push Docker Image') {
            steps {
                // Log in to Docker Hub and push the image using stored credentials
                sh '''
                  docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW
                  docker push ${DOCKERHUB_REPO}:latest
                '''
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Restart the Kubernetes deployment to pick up the new image
                // Ensure your Jenkins has a proper kubeconfig or use withKubeConfig if configured as a credential.
                sh "kubectl rollout restart deployment studentsurvey -n ${K8S_NAMESPACE}"
            }
        }
    }
    post {
        always {
          echo 'Cleaning up...'
        }
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
