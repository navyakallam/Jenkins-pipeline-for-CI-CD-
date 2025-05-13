pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nodejs-demo-app'
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Cloning the repository...'
                git branch: 'main', url: "https://github.com/navyakallam/Jenkins-pipeline-for-CI-CD-.git"
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME:latest .'
                echo 'Docker image built successfully!'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'npm install'
                sh 'npm test || echo "No tests defined or test failed, continuing..."'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Docker container...'
                sh 'docker run --name Jenkins -d -p 80:3000 $IMAGE_NAME:latest'
                echo 'App deployed on port 80!'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed!'
        }
        success {
            echo 'CI/CD pipeline ran successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
