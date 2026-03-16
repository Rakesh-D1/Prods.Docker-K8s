JAN 24

What is JENKINS

Jenkins is a open sournce tool its also known as a automation server which helps in Continuous Integration and Continuous Delivery/Deployment . 

using the jenkins we can build a software, test at the same software & deploy it. 

So WHAT WE CAN ACHIVE WITH JENKINS IS: 
  1. It builds our code

  2. It runs tests

  3. checks quality of the code

  4. deploys the app

  5. it does all this automatically whenever code changes.

JENKINS Architechture
- jenkins start with the freestyle projects only, it supported one type of job.
- Freestyle is more like we are using the mouse click events in Jenkins UI. Entire job logics is created by mouse click.
- here using the mouse click we create our job builds, the job logic is baciscally created in UI by mouse cliock options
- To get more features we need to add more plugins & add build steps.

Issue with the FREESTYLE JOB is
-  there is  there is no configuration available as code.
 - It is not, you cannot store a freestyle job as a source code. we can not track changes in the free style projects , who , what, when, why the 
 changes has happened.
 - we cannot track r will get startsthe pre post of the job build for accountability & the audit trail its needed, so lack of tracebility can lead to 
    consiquences
 - work flow control is very limited in this case Execution is very much linear. Complex workflows involving, so more plugins needed in this
    case. Its very tedious task to make a configuration in this case
 - Parallel execution become very difficult & heavy denpedecny on plugins, regular update needed of plugins & incompatible issues between the plugins
 
 PIPELINE JOBS
  - pipeline as code is a modern approach, here we write the scripts to acheive the PAC to to write this code we are writting in the JENKINS FILE
  which is sharable.
  - What is pipeline jobs benifits You can store directly in Jenkins as pipeline script or in source control by writing a Jenkins file separately.
  - so basically when you are writing a Jenkins file or doing it like this, so even if you do it as a Jenkins pipeline script, 
    still that code will be available by from the Jenkins UI, so it is still traceable.
  - pipeline as code is PAC makes versioning, tracking changes, reviews, rollbacks it becomes more easierer
  - pipeline as code PAC helps with MULTIPLE STAGES & PARALLEL EXECUTION & CONDITIONAL LOGICS & REUSABLE LOGIC
  
  MULTI CONFIGURATION PROJECT

It sbascally used by the testing team , here one Job with combnation of variables like same app in different OS JDK , 
test same thing in multipkle configuration

FOLDER

here dont have any build, here we have to put Jobs in a namesapce , Floder leavel permission , like RBAC mainiatn the folder decipline



MULLIBRANCH PIPELINE
This is a pipeline.  its like a pipeline factory, which is driven more by Git branches. 
FOr e.g 5 dev working on same project & all the dev has given differnt tasks they will work in there own brtanch & the QE will test in the 
same branches once all these are verified it will send to the main branch

---------------------------------------------------------------------------------

  JENKINS ROLE IN ARCHITECHTURE LEVEL

  - If we consider the Jenkins role it has two aspects JENKINS CONTROLLER & JENKINS AGENT
  
  - JENKINS CONTROLLER & JENKINS AGENT can be in same machine in our case have that in the my-jenkins container.
  - JENKINS CONTROLLER & JENKINS AGENT  has the different role.
  - In our case the instaruction will come from my-jenkins container as the Jenkins controller & the DIND jenkins-docker as the agent
  - Here the Jenkins controller is the brain, it will manage the jobs, orchstration, scheduling , build historyare with the jenkins controller
    its a co-ordinator
  - The jenkins agent will recive instruiction from the controller, run all the instructions in the pipelin stage & again send back the instruction
    to the controller
  - One jenkins setup must have one agent or else the controller-agent framework wont work

  This is what two logical roles use to do

  HOW A JOB EXECUTES IN THE PIPELINE?
  - Once we click the build now in the jenkins UI what will happen ?
        - Controller will parse the instruction to the pipeline
        - After that it will determine which all stages is needed.
        - Each stage controller will select one agent, that is mentioned in the code. 
        - Now one agent is selected, that agent will work as the worker.
        - Agent will excute the commands & capture the output & capture the exit code. Agent capture the output & send to the controller.
        - Output & exit code should availble with the controller, that is the responsibility of the agens to give the output to the controler
        - In controller if we are seraching for the log, updates on build controller, any display result all are in the controller w can search
        - All workload are added on the agent,& all the task are distributed to the agents, Jobs are spread across the agents.
        - We can isolates the work on the agents.
        - The basic architechture will be one COntroller & many agents.
        - A agestns cab ne linux, dokcer or cloud vm
        - we are using the docker as the agent.
        - For non production machines we use the controller & agent in one machine .

Its a Groovy based declarative pipeline DSL the PAC the complete fomat is groovy


