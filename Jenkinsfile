pipeline{
   agent any
   environment{
	NEXUS_VERSION="nexus3"
	NEXUS_PROTOCOL="http"
	NEXUS_URL="localhost:8081"
	NEXUS_REPOSITORY="sample-repo"
	NEXUS_CREDENTIAL_ID="Nexus_ID"
        def mavenPom=readMavenPom file:'pom.xml'
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
	stage('build')
	{
	  steps{
		bat 'mvn clean install'
	       }
	  
	}
	stage('Unit Testing')
	{
	  steps{
		bat 'mvn test'
	       }
	  
	}
	
	stage('Sonarqube Analysis')
	{
	  steps{
		bat script: '''mvn sonar:sonar \
		-Dsonar.host.url=http://localhost:9000 \
		-Dsonar.login=9483545c1871b04dc0162f7b5726b475b1153f3e'''
	       }
	}
	stage('Uploading Nexus Artifact')
	{
	  steps{
		script{
			
			nexusArtifactUploader artifacts:[
				[
					artifactId: 'spring-petclinic',
					classifier:'',
					file:"target/spring-petclinic-${mavenPom.version}.jar",
					type:'jar'
				]
			],
			credentialsId:NEXUS_CREDENTIAL_ID,
			groupId:'org.springframework.samples',
			nexusUrl:NEXUS_URL,
			nexusVersion:NEXUS_VERSION,
			protocol:NEXUS_PROTOCOL,
			repository:NEXUS_REPOSITORY,
			version:"${mavenPom.version}"
			}
	       }
	}
        stage('Deploy')
	{
	  steps{
		bat 'java "-Dserver.port=8001" -jar target/spring-petclinic-${mavenPom.version}.jar'
	       }
	}
	
   }
        post{
                always{
                        junit '/target/surefire-reports/*.xml'
                }
        }
		
	     
}
