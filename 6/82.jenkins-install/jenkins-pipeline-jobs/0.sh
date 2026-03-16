pipeline {
    agent any

    stages {
        stage('Build-pc') {
            steps {
                echo 'build a new pc'
                sh 'mkdir Build-pc'
                sh 'touch Build-pc/comp.txt'
                sh 'echo "motherboard"'
            }
        }   
    }
}