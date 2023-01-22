pipeline {
	
 agent none
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
//     stage('Maven test') {
    	
//       steps {
//       	sh 'mvn clean test'
//       }
//     }
//           stage('Conftest') {
//     steps {
//         script {
//             docker.image("openpolicyagent/conftest").inside("--entrypoint=") {
//                 sh "conftest test --policy dockerfile-security.rego  Dockerfile"
//             }
//         }
//     }
// }
          stage('Conftest') {
    steps {

                sh "conftest test --policy dockerfile-security.rego  Dockerfile"
            }
       
    }

//        stage('Docker Check') {
//       agent {
//       	docker {
//         	image 'openpolicyagent/conftest:latest'
//         }
//       }
//       steps {
//       	sh 'conftest test --policy dockerfile-security.rego  Dockerfile'
//       }
//     }
          
     stage('Docker Build') {
      agent any
      steps {
      	sh 'docker build -t saimanas123/spring-petclinic:latest .'
      }
    }
  }
}
