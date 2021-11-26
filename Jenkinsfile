pipeline{
   agent any
   environment{
	NEXUS_VERSION="nexus3"
	NEXUS_PROTOCOL="http"
	NEXUS_URL="localhost:8081"
	NEXUS_REPOSITORY="manas_sample"
	NEXUS_CREDENTIAL_ID="Nexus_ID"
        
       }
   stages{
	stage('Checkout')
	{
          steps{
	         checkout([
			$class:'GitSCM',
			branches:[[name:'*/master']],
			extensions:[],
			userRemoteConfigs:[[url:'https://github.com/saimanasg/spring-petclinic.git']]
		])
          }
	}
// 	stage('Build')
// 	{
// 	  steps{
// 		bat 'mvn clean install'
// 	       }
	  
// 	}
// 	stage('Unit Testing')
// 	{
// 	  steps{
// 		bat 'mvn test'
// 	       }
	  
// 	}
	
// 	stage('Sonarqube Analysis')
// 	{
// 	  steps{
// 		bat script: '''mvn sonar:sonar \
// 		-Dsonar.host.url=http://localhost:9000 \
// 		-Dsonar.login=9483545c1871b04dc0162f7b5726b475b1153f3e'''
// 	       }
// 	}
	stage('Uploading Nexus Artifact')
	{
	  steps{
		script{
			def mavenPom=readMavenPom file:'pom.xml'
			nexusArtifactUploader artifacts:[
				[
					artifactId: "A",
					classifier:'',
                                        file:"target/spring-petclinic-${mavenPom.version}.jar",
					type:'jar'
				]
			],
			credentialsId:NEXUS_CREDENTIAL_ID,
			groupId:"B",
			nexusUrl:NEXUS_URL,
			nexusVersion:NEXUS_VERSION,
			protocol:NEXUS_PROTOCOL,
			repository:NEXUS_REPOSITORY
			version:"2.2.2"
			}
	       }
	}
//         stage('Deploy')
// 	{
// 	  steps{
//                //deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://18.219.186.29:8080/')], contextPath: 'note', war: '**/*.war'
//                // bat 'scp -i "D:/STUDY/AWS/KeyPairs/mrng.pem" ec2-user@18.191.89.200 target/spring-petclinic-2.5.0-SNAPSHOT.jar ec2-user@18.191.89.200:/home/ec2-user'    
// 	        //sshagent(['deploy_user']) {
//                 //                bat "scp -o StrictHostKeyChecking=no target/spring-petclinic-2.5.0-SNAPSHOT.jar ec2-user@3.144.207.66:/opt/apache-tomcat-9.0.55/webapps"
//                 //        }     
//                 echo 'hello'
          
//           }
// 	}
	
   }
//         post{
//                 always{
//                         junit '/target/surefire-reports/*.xml'
//                 }
//         }
		
	     
}
