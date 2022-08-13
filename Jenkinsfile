pipeline{
    agent any
    environment {
        SSH_CRED = credentials('SSH-Centos7')
    }
    
    stages
    {
        stage('Started dry-run') {
            steps{
            sh "started"
            sh "ansible-playbook -i inventory robo-dryrun.yml -u centos -e ansible_password=DevOps321 -e COMPONENT=mongodb -e ENV=dev"
        }
        }
    }
}