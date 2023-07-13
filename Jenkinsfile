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
                    echo "1111"
                    docker.image('my-image:latest').inside {
                        // 絶対パスで作業ディレクトリを指定
                        sh 'cd ${env.WORKSPACE} && python script.py > output.txt'
                    }

                    echo "2222"
                    docker.image('my-image:latest').withRun { container ->
                        docker.cp("${container.id}:/path/to/output.txt", "output.txt")
                    }
                    echo "3333"
                    sh 'cat output.txt'
                }
            }
}

    }
}

