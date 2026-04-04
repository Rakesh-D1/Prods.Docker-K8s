30th january

Pipeline

- Pipeline is wrapper of the entire code
- Pipeling is a jenkins specific groovy syntax
- Piplelin block will only work in the jenkins pipelin

Directive

- What is the purpose here, what pipeline will do

Agent 
- Agent is where to run whether the installed node , whould be earlier installed or else built in Node or else it will be docker

Stages 
- Collection of one or more stage
- Stage will be a container for sequence of step of actual command

Post
- After action to take, after the pipeline run it can be success, or fail or cleanup

Environment 
- Environemnnt is Key value pair for vairables , secrets e.g access key & secret tokens.

Options
- Pipeline wise settings, it will be applicable on entire pipeline

This is the scprit we have created 
pipeline {
    agent any

    stages {
        stage('Build-pc') {
            steps {
                echo 'build a new pc'
                sh 'mkdir -p Build-pc'
                sh 'touch Build-pc/comp.txt'
                sh 'echo "motherboard" >> Build-pc/comp.txt'
                sh 'cat Build-pc/comp.txt'
                sh 'echo "display" >> Build-pc/comp.txt'
                sh 'cat Build-pc/comp.txt'
                sh 'echo "keyboard" >> Build-pc/comp.txt'
                sh 'cat Build-pc/comp.txt'
            }
        }
    }
}

Now whenever we do the build then its not taking it as a clean state , its keep on adding the same line again & again
wehn we do rebuild the workspace need to clear
workspace persist the data
Jenkins will not clean the workspace automatically we need to mention it
So due to this the state leakage will happen the older build wehihc we careat ecan get leak ot the new build we have executed

Now we have to fix it, to fix it we need to mention this in the post action

pipeline {
    agent any

    stages {
        stage('Build-pc') {
            steps {
                echo 'build a new pc'
                sh 'mkdir -p Build-pc'
                sh 'touch Build-pc/comp.txt'
                sh 'echo "motherboard" >> Build-pc/comp.txt'
                sh 'cat Build-pc/comp.txt'
                sh 'echo "display" >> Build-pc/comp.txt'
                sh 'cat Build-pc/comp.txt'
                sh 'echo "keyboard" >> Build-pc/comp.txt'
                sh 'cat Build-pc/comp.txt'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

Now the issue post wirjing the code blokc if we meintion the Post blokc it will delete the the workspace