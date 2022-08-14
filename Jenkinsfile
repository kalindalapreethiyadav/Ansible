pipeline {
   agent any

    stages {
        stage('Do a dry-run') {        // This will be executed only when you raise a PR
            steps {
                sh "curl ifconfig.co"
                sh "ansible-playbook -i inventory -u centos -e ansible_password=DevOps321 -e COMPONENT=user -e ENV=dev robo-dryrun.yml"
            }
        }

    }
}


// Tag will be pushed only against the main branch and when we push a tag that means new version ready and that means some stage has to run
// Scan should happen automatic

// Release is like marking a version 
// Every release doesn't have to hit prod,  one versions of your choice which gives nice feature will only be marked as Prod-Release