31 Dec

--Now the Jenkins build we are triggering , the build is accomplished in Built-in node where the My-Jenkins containeer the jenkins controller is
also there
---The agent where the builds are comminted now are done insde the built-in Node, which  can be found inside the jenkins GUI got Jenkins manage >>
Nodes >> built-In-Node & that is the agent
--Built in node is not a controller, its isntalled along with the controller but ot the controller it is, inside that all our prsent
jenkins output is showing.
-- The Built in node is in the My-Jenkins container
-- Now we have used the agent as "Any" thats why its choosed the built-in-node agent or else if we add any other agents like Docker 
    It will

---------------------------------------------------------------------------------------------
Now in the Jenkins build in last chapter we have added the function 
    }
    post {
        always {
            cleanWs()
        }
    }
}
at the post function its basically removed the artifcats after the build has generated whihc is actually a issue

---

Now to overcome this issue we need to first cleanup the workspace rather than in the POST , so the command is

pipeline {
    agent any

    stages {
        stage('Build-pc') {
            steps {
                cleanWs()
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


Now in the POST block it will cehck the comp.txt  is present in the Build-pc directory
    post {
        success {
          archieveArtificats artifacts: 'Build-pc/**'
        }
    }
}


Final this groovy file as worked
pipeline {
    agent any

    stages {
        stage('Build-pc') {
            steps {
                cleanWs()
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
    success {
        archiveArtifacts artifacts: 'Build-pc/**'
    }
}
}   