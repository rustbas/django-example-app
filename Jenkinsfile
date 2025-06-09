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
                        credentialsId: '73d234d2-3f9d-44e9-97fc-b6317070b462',
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
}   
