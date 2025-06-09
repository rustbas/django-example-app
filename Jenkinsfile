pipeline {
    agent any


    stages {
        stage('Hello') {
            steps {
                echo 'Hello from Jenkins'
            }
        }
        stage('Connect to server') {
            steps {
                withCredentials([
                    sshUserPrivateKey(
                        credentialsId: ${{ secrets.JENKINS_CREDS_ID }},
                        keyFileVariable: 'SSH_PRIVATE_KEY'
                    )
                ]) {
                    sh '''#!/bin/bash
                    ssh -i "$SSH_PRIVATE_KEY" -p 2222 saccada@saccada.xyz << EOF
                        cd ~/ws/django-example-app
                        git pull --rebase
                        docker compose pull
                        docker compose down
                        docker compose up -d
                        '''
                }
            }
        }
    }
    post {
        always {
            sleep 5
        }
    }
}   
