pipeline {
    agent any

    environment {
        GIT_URL="https://github.com/larajorge11/terraform-flask-pets"
        CREDENTIALS_GIT_ID = 'github_lara'
        GIT_BRANCH="main"
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key_dev')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_key_dev')
        REGION = 'us-east-2'
    }


    stages {

        stage("Parameters") {
            steps {
                script {
                    properties([
                        parameters([
                            booleanParam(
                                defaultValue: false, 
                                description: '', 
                                name: 'Parameter_Terraform_Destroy'
                            )
                        ])
                    ])
                }
            }
        }

        stage("SCM") {
            when {
                expression {
                    params.Parameter_Terraform_Destroy == false
                }
            }
            steps {
                git branch: "${GIT_BRANCH}",
                credentialsId: "${CREDENTIALS_GIT_ID}",
                url: "${GIT_URL}"
            }
        }

        stage("Terraform Init") {
            steps {
                sh 'terraform init'
            }
        }

        stage("Terraform Apply") {
            when {
                expression {
                    params.Parameter_Terraform_Destroy == false
                }
            }
            steps {
                sh """
                    #Working with aws credentials of the personal account 
                    terraform apply -var aws_access_key='${AWS_ACCESS_KEY_ID}' \
                    -var aws_secret_key='${AWS_SECRET_ACCESS_KEY}' \
                    -var aws_region='${REGION}' \
                    -auto-approve
                """
            }
        }

        stage("Terraform Show") {
            steps {
                sh 'terraform show'
            }
        }

        stage("Terraform Destroy") {
            when {
                expression {
                    params.Parameter_Terraform_Destroy == true
                }
            }
            steps {
                sh """
                    terraform destroy -var aws_access_key='${AWS_ACCESS_KEY_ID}' \
                    -var aws_secret_key='${AWS_SECRET_ACCESS_KEY}' \
                    -var aws_region='${REGION}' \
                    -auto-approve

                """
            }

        }
    }
}