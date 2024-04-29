pipeline{

  agent any

  stages{
    stage('Fitch last code updates'){
      steps{
        git(url: 'https://github.com/AhmedHEl-Tonoby/NTI-Project.git', branch: 'main')

      }
    }


    stage('build Image'){
      steps{
        sh "docker build -t simpledjangoapp-docker-master_web:${env.BUILD_NUMBER} simpledjangoapp/."                    
        sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183792206.dkr.ecr.us-east-1.amazonaws.com"
        sh "docker tag simpledjangoapp-docker-master_web:${env.BUILD_NUMBER} 590183792206.dkr.ecr.us-east-1.amazonaws.com/simpledjangoapp-docker-master_web:${env.BUILD_NUMBER}"
        sh "docker push 590183792206.dkr.ecr.us-east-1.amazonaws.com/simpledjangoapp-docker-master_web:${env.BUILD_NUMBER}" 
                

      }
    }

    stage('update k8s files'){
      steps{
        sh "sed -i 's|image:.*|image: p590183792206.dkr.ecr.us-east-1.amazonaws.com/simpledjangoapp-docker-master_web:${env.BUILD_NUMBER}|g\' Kubernetes/deployment.yml"
      }
    }
