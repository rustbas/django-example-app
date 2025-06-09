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
                    sh "ssh -i $SSH_PRIVATE_KEY saccada@saccada.xyz 'find ~/ws'"
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
