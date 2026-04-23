Feb 5

Environment Variables

steps {
                cleanWs()
                echo 'build a new pc'
                sh '''
                    mkdir -p Build-pc
                    touch Build-pc/comp.txt
                    echo "motherboard" >> Build-pc/comp.txt
                    cat Build-pc/comp.txt
                    echo "display" >> Build-pc/comp.txt
                    cat Build-pc/comp.txt
                    echo "keyboard" >> Build-pc/comp.txt
                    cat Build-pc/comp.txt
                '''
            }
In above code the comp.txt is hard coded & that single value used multiple time byhard coding rather than declare that specific value
in global
Now if i have to update the text comp.txt then I suppose to manuyally remove & add it manuaaly in each line

To overcome this issue define it once globally & use it in entire project
-
pipeline {
    agent any
    
    environment {
        BUILD_FILE_NAME = 'laptop.txt'
    }

    stages {
        stage('Build-pc') {
            steps {
                cleanWs()
                echo 'build a new pc'
                echo "$BUILD_FILE_NAME"
                sh '''
                    mkdir -p Build-pc
                    touch Build-pc/comp.txt
                    echo "motherboard" >> Build-pc/comp.txt
                    cat Build-pc/comp.txt
                    echo "display" >> Build-pc/comp.txt
                    cat Build-pc/comp.txt
                    echo "keyboard" >> Build-pc/comp.txt
                    cat Build-pc/comp.txt
                '''
            }
        }

        stage('Test Artifacts') {
            steps {
                echo 'testing artifacts'
                sh 'test -f Build-pc/comp.txt'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'Build-pc/**'
        }
    }
}