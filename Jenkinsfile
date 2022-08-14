pipeline {
   agent any
   parameters {
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Chose the environment')
        string(name: 'COMPONENT', defaultValue: '', description: 'Enter the name of the component')
    }
    environment {
        SSH_CRED = credentials('SSH-Centos7')
    }

    stages {
        stage('Do a dry-run') {        // This will be executed only when you raise a PR
            steps {
                sh "curl ifconfig.co"
                sh "env"
                sh "COMPONENT"
                sh "ansible-playbook robot-dryrun.yml -e ansible_user=${SSH_CRED_USR} -e ansible_password=${SSH_CRED_PSW} -e COMPONENT=${params.COMPONENT} -e ENV=${params.ENV}"
            }
        }

    }
}


// Tag will be pushed only against the main branch and when we push a tag that means new version ready and that means some stage has to run
// Scan should happen automatic

// Release is like marking a version 
// Every release doesn't have to hit prod,  one versions of your choice which gives nice feature will only be marked as Prod-Release