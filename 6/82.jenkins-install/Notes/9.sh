28th january

JENKINS SYNTAX

What ever we write inside the Pipeline script we consider it as a jenkins groovy script.
Jenkins syntax we call it as a declarative pipeline
The Syntax we call it as a declarative pipeline
It will use groovy syntax model but will use but when we use it in Jenkins it has it own language.

E.g how we write in the jenkins
Pipeline {...}
This pipeline is a jenkins specific declarative language.. Its using the groovy model & Its not using the totally the Groovy but has the similarity, like the JSON language
Once we declare the syntax as pipeline the Jenkins will parase this before running anything, it will discard if anything is wrong.

AGENT keyword
By default it will written as Any , so the jenkins will run the script on any available agent, jenkins will pick the nearest one if the ANY is mentioned as the agent.

This ANY can be jenkins controller itself or any other connected worker or agent node. If we have mentioned it as a agent node then we have to define a different machine.
We can mention the docker also as a agnet which is in our case.

Pipeline is divided into stages.
Stages has the child element stage inside it, to perform any steps in the pipeline we use the steps

Actually Jenkins execute those steps which are mentioned inside the stage.
All the declarative steps need to mention in the steps block
Any linux steps we are performing, that need to mentioned inside that steps with ‘sh’ as the command in the steps

POST block in the jenkins pipeline..psot block define any actions after the operation over.
It perform after the pipeline or stages finishes or fails

ALWAYS if the build success, failed, abort or unstable the steps will execute

