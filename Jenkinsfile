pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Dockerコンテナのビルド
                script {
                    docker.build('my-image:latest', '-f Dockerfile .')
                }
            }
        }
        stage('Run') {
            steps {
                script {
                    def output = docker.image('my-image:latest').run()
                    docker.image('my-image:latest').inside {
                        sh 'python script.py > output.txt'
                    }
                    docker.image('my-image:latest').withRun { container ->
                        docker.cp("${container.id}:/path/to/output.txt", "output.txt")
                    }
                    sh 'cat output.txt'
                }
            }
}

    }
}

