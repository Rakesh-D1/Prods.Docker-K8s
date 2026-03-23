Jan 28
NOTES
Groovy based Jenkins declarative pipeline
(Jenkind Pipeline)
- With the Jenkind pipeline file we can create the Jenkins pipeline along with that 

JENKINSFILE SYNTAX

its a declarative pipeline, Jenkins has its own keyword, it will sue the mopdel of Groovy,nbut the syntax are declarative .
e.g 
pipeline {

}

Jenkins using grrovy  mod, so when we wirht the sepcif word pipeline Jenkins will parse tthis before  running anything, if Jenkins found anything 
wrong it will reject it.

AGENT synbtax
e.g 
pipeline {
agent any

agent docker:dind
}

If we add as any it will run the pipeline on any available agent... Her jenkins will parse & pcik tthe nearest one agent

