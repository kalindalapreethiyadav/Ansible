pipeline {
   agent any
   parameters {
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Chose the environment')
        string(name: 'COMPONENT', defaultValue: 'redis', description: 'Enter the name of the component')
    }
    environment {
        SSH_CRED = credentials('SSH-Centos7')
    }

     stages {
        
        stage('Lint Checks') {  // This will be executed against the feature branch only
            when { branch pattern: "feature-.*", comparator: "REGEXP"}
            steps {
                sh "env"
                sh "echo Style Checks"
                sh "echo running is feature branch"
            }
        } 

        stage('Do a dry-run') {        // This will be executed only when you raise a PR
             when { branch pattern: "PR-.*", comparator: "REGEXP"}
            steps {
                sh "env"   // Just to see tne environment variables as a part of the pipeline
                sh "ansible-playbook -i inventory -e ansible_user=${SSH_CRED_USR} ansible_password=${SSH_CRED_PSW} -e COMPONENT=${params.COMPONENT} -e ENV=${params.ENV} robo-dryrun.yml"
            }
        }

<<<<<<< HEAD
     stage('Tagging') {
            when { branch 'main' }       
            steps {
                git branch: 'main', credentialsId: 'Gitub-Token', url: 'https://github.com/kalindalapreethiyadav/Ansible.git'
=======
 stage('Tagging') {
            when { branch 'main' }       
            steps {
                git branch: 'main', credentialsId: 'Gitub-Token', url: 'https://github.com/kalindalapreethiyadav/Ansible.git'
                sh "bash -x auto-tag.sh"   
            }
        }




    }
}


// Tag will be pushed only against the main branch and when we push a tag that means new version ready and that means some stage has to run
// Scan should happen automatic

// Release is like marking a version 
// Every release doesn't have to hit prod,  one versions of your choice which gives nice feature will only be marked as Prod-Release