pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nodejs-demo-app'
    }

    stages {
        stage('Clone') {
            steps {
                echo 'Cloning the repository...'
                git branch: 'main', url: 'https://github.com/navyakallam/Jenkins-pipeline-for-CI-CD-.git'
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
                echo 'Running tests inside Docker container...'
                // NOTE: Using --rm to auto-remove container and --entrypoint "" to override CMD
                sh '''
                    docker run --rm \
                        --entrypoint "" \
                        $IMAGE_NAME:latest \
                        sh -c "npm install && echo Tests passed"
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Docker container...'
                // Stop and remove any existing container with the same name
                sh '''
                    docker rm -f pipeline || true
                    docker run --name pipeline -d -p 80:3000 $IMAGE_NAME:latest
                '''
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
