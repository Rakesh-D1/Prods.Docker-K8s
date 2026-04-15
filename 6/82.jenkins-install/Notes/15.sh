Feb 4

Stages in the Pipeline

-- Till now post build we have chkd the artifacts in manual.
-- Now have to create in pipeline so it will verify itsself the artifacts there or not.
-- We have to create a new stage to verify the artificats there or not
To verify the archive is exist of not we have to verify the 

pipeline {
    agent any

    stages {
        stage('Build-pc') {
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

-----------------------------------------------------------
       stage('Test Artifacts') {
            steps {
                echo 'testing artifacts'
                sh 'test -f Build-pc/comp.txt'
            }
        }
    } In this stage it will check the text file is available or not h 'test -f Build-pc/comp.txt' after veirfying thiss it make sure the  
    artificats is there