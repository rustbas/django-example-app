def remote=[:]
remote.name = 'saccada.xyz'
remote.host = 'saccada.xyz'
remote.allowAnyHosts = true


pipeline {
    agent any

    environment {
        CREDS=credentials('73d234d2-3f9d-44e9-97fc-b6317070b462')
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello from Jenkins'
            }
        }
        stage('Connect to server') {
            steps {
                script {
                    remote.user = env.CREDS_USR
                    remote.password = env.CREDS_PSW
                }
                sshCommand(remote: remote, command: "find ~/ws")
            }
        }
    }
    post {
        always {
            sleep 5
        }
    }
}   
