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
        stage ('lint checks') { 
            when { branch pattern: "feature-*", comparator: "REGEXP" }
            steps
            {
                sh "env"
                sh "echo need to exute when job is created in Feature branch"
            }

        }
        //stage('Do a dry-run') {        // This will be executed only when you raise a PR
         //   steps {
          //      sh "Need to run when PR is raised"
         //       sh "ansible-playbook robot-dryrun.yml -e ansible_user=${SSH_CRED_USR} -e ansible_password=${SSH_CRED_PSW} -e COMPONENT=${params.COMPONENT} -e ENV=${params.ENV}"
       //     }
     //   }
//
    stage ('prompt to prod') {
        when { branch 'main' }
         steps {
                sh "when tag is raised then deploy to prod"
            }
    }

    }
}


// Tag will be pushed only against the main branch and when we push a tag that means new version ready and that means some stage has to run
// Scan should happen automatic

// Release is like marking a version 
// Every release doesn't have to hit prod,  one versions of your choice which gives nice feature will only be marked as Prod-Release