pipeline {
    agent any
    environment {
        PROJECT_ID = 'trial-velostrata'
        CLUSTER_NAME = 'test'
        LOCATION = 'asia-southeast1'
        CREDENTIALS_ID = 'gke'
    }
    stages {
        stage('TF Plan') {
            steps{
                sh 'yes | cp -i /var/lib/jenkins/tfstate/terraform.tfstate /var/lib/jenkins/workspace/aws-terraform/'
                sh 'yes | cp -i /var/lib/jenkins/tfstate/terraform.tfstate.backup /var/lib/jenkins/workspace/aws-terraform/'                
                sh 'terraform init'
                sh 'terraform plan'                 
            }
          }
        
        stage('Approval Apply') {
            // no agent, so executors are not used up when waiting for approvals
            agent none
            steps {
                script {
                    def deploymentDelay = input id: 'Deploy', message: 'Apply this changes?', submitter: 'rkivisto,admin', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                    sleep time: deploymentDelay.toInteger(), unit: 'MINUTES'
                }
            }
        } 
        stage('TF Apply') {
            steps {
                sh 'terraform apply -auto-approve'
                sh 'yes | cp -i /var/lib/jenkins/workspace/aws-terraform/terraform.tfstate /var/lib/jenkins/tfstate'
                sh 'yes | cp -i /var/lib/jenkins/workspace/aws-terraform/terraform.tfstate.backup /var/lib/jenkins/tfstate'
      }
    }
        stage('Approval Destroy') {
            // no agent, so executors are not used up when waiting for approvals
            agent none
            steps {
                script {
                    def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'rkivisto,admin', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                    sleep time: deploymentDelay.toInteger(), unit: 'MINUTES'
                }
            }
        } 
        stage('TF Destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
                sh 'yes | cp -i /var/lib/jenkins/workspace/aws-terraform/terraform.tfstate /var/lib/jenkins/tfstate'
                sh 'yes | cp -i /var/lib/jenkins/workspace/aws-terraform/terraform.tfstate.backup /var/lib/jenkins/tfstate'                
      }
    }             
  }
}
