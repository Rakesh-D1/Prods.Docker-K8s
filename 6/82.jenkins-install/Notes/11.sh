Jan 26

JENKINS ARCHITECHTURE

Pipeline as Job (pipeline as code)
 1. Pipeline jobs can store directly in Jenkins as pipeline script or in source control by writing a Jenkins file separately.
 2. With PAC  versioning, change tracks, reviews, rollbacks, all of this becomes way easier & much better visibility.
 3. Pipeline are design for modern CICD applications.
 4. Pipeline break it down into multiple stages, where exactly is it failing?
 5. parallel execution. At the same time the multiple pipeline executes
 6. conditional logic
 7. Reusable logic

 As Jenkins architechture it has two roles JENKINS CONTROLLER & JENKINS AGENT

 When we install jenkins it has the in built jenkins agent

 JENKINS CONTROLLER is called the master & JENKINS AGENT is Node ...

 Until we are not invoking any ohter machine/Virtual machin as a Node, unitl we are using the in-built node of Jenkins...In my case the agent is
 the DIND , the agent in my acrichtechture is coontainerized (DIND)... The instrcution is coming from the my-jenkins

 Jenkins controller is the brain it manage the jobs, pipeline orechestration, build historey , schedule etc what when to be doen is done by the 
 jenkins

 -- Agent will recieve instructions from controller, run all step in piplein stage & sendback the result to the controller.

 -- One jenkins setup must have one agent..

 How a Job executes ?
 Once in the Jenkins GUI clicking the Build now button what is process after that ..
    -- Controller will parse the pipeline, after that it will determine whihc all stages are needed.
    -- After that each stage the controller will select the available agent
    -- Fore each stage the controller will select the available agent whihc will be mentioned the code.
    -- If agent is any it will use the by default jenkins agent.
    -- Now once the agent is selected that is worker, it will execute the command in that agent & capture the output/exit code like 0 ,1 etc
    -- Agent will capture the output & send back to the controller, exit code result should be with Controller .


In PAC pipeline as code we use DSL domain specific langualge of Groovy... Groovy is host language.