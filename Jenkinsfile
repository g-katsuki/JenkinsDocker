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
                // Dockerコンテナの実行
                script {
                    docker.image('my-image:latest').run()
                }
            }
        }
    }
}

