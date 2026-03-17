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


2nd Build ------------------------------------

pipeline {
    agent any

    stages {
        stage('Build-pc') {
            steps {
                echo 'build a new pc'
                sh 'mkdir -p Build-pc'
                sh 'touch Build-pc/comp.txt'
                sh 'echo "motherboard" >> Build-pc/comp.txt'
            }
        }
    }
}