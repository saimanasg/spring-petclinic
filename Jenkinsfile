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
    stage('Docker Push') {
      agent any
            steps{
//                     withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
//         	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker login -u saimanas123 -p dckr_pat_BfJGlavANkyEf4x3lApm-pqbMx0'
          sh 'docker push saimanas123/spring-petclinic:latest'
        
            }
      
    }      
          
    
  }
       post{
               
                always{
                        
                        junit '/target/surefire-reports/*.xml'
                }
        }
}
