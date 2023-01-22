pipeline {
	
 agent any
        
  stages {
  	stage('Maven Install') {
    	agent {
      	docker {
        	image 'maven:3.6.3-jdk-8'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
    stage('Maven test') {
    	agent {
      	docker {
        	image 'maven:3.6.3-jdk-8'
        }
      }
      steps {
      	sh 'mvn test'
      }
    }
//           stage('Conftest') {
//     steps {
//         script {
//             docker.image("openpolicyagent/conftest").inside("--entrypoint=") {
//                 sh "conftest test --policy dockerfile-security.rego  Dockerfile"
//             }
//         }
//     }
// }
//           stage('Conftest') {
//            agent any
//     steps {

//                 sh "conftest test --policy dockerfile-security.rego  Dockerfile"
//             }
       
//     }


          
     stage('Docker Build') {
      agent any
      steps {
      	sh 'docker build -t saimanas123/spring-petclinic:latest .'
      }
    }
          
          
//      stage('Trivy Scan'){
//      agent any
//              steps{
                       
//              }     
//      }
    stage('DockerHub Push') {
      agent any
           
            steps{

          sh 'docker login -u saimanas123 -p dckr_pat_BfJGlavANkyEf4x3lApm-pqbMx0'
          sh 'docker push saimanas123/spring-petclinic:latest'
        
            }
      
    }      
          
          
//      stage('Docker Build') {
//       agent any
//       steps {
//       	sh 'docker build -t saimanas123/spring-petclinic:latest .'
//         sh 'docker tag saimanas123/spring-petclinic nexus-1416675214.us-east-1.elb.amazonaws.com:9090/docker-images/spring-petclinic'
//       }
//     }
          
          
//      stage('Trivy Scan'){
//      agent any
//              steps{
                       
//              }     
//      }
    stage('Nexus Push') {
      agent any
           
            steps{
         sh 'docker tag saimanas123/spring-petclinic nexus-1416675214.us-east-1.elb.amazonaws.com:9090/docker-images/spring-petclinic-${BUILD_NUMBER}'
          sh 'docker login -u admin -p admin nexus-1416675214.us-east-1.elb.amazonaws.com:9090'
         
          sh 'docker push nexus-1416675214.us-east-1.elb.amazonaws.com:9090/docker-images/spring-petclinic-${BUILD_NUMBER}'
        
            }
      
    }      
    stage('ECR Push') {
      agent any
           
            steps{

          sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 126986921526.dkr.ecr.us-east-1.amazonaws.com/testrepo'
          sh 'docker tag saimanas123/spring-petclinic 126986921526.dkr.ecr.us-east-1.amazonaws.com/testrepo/docker-images/spring-petclinic-${BUILD_NUMBER}'
          sh 'docker push 126986921526.dkr.ecr.us-east-1.amazonaws.com/testrepo/docker-images/spring-petclinic-${BUILD_NUMBER}'
        
            }
      
    }     
          
    
  }
       
}
