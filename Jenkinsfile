pipeline{
   agent any
   environment{
	NEXUS_VERSION="nexus3"
	NEXUS_PROTOCOL="http"
	NEXUS_URL="localhost:8081"
	NEXUS_REPOSIORY="sample-repo"
	NEXUS_CREDENTIAL_ID="Nexus_ID"
       }
   stages{
	stage('Checkout')
	{
	  checkout([
			$class:'GitSCM',
			branches:[[name:'*/master']],
			extensions:[],
			userRemoteConfigs:[[url:'https://github.com/saimanasg/spring-petclinic.git']]
		])
	}
	stage('Build')
	{
	  steps{
		bat 'mvn build'
	       }
	}
	stage('Unit Testing')
	{
	  steps{
		bat 'mvn test'
	       }
	  post{
		junit '/target/test-reports/*.xml'
	       }
	}
	
	stage('Sonarqube Analysis')
	{
	  steps{
		bat script: '''mvn sonar:sonar \
		-Dsonar.host.url=http://localhost:9000 \
		-Dsonar.login= 9483545c1871b04dc0162f7b5726b475b1153f3e'''
	       }
	}
	stage('Uploading Nexus Artifact')
	{
	  steps{
		script{
			def mavenPom=readMavenPom file:'pom.xml'
			nexusArtifactUploader artifacts:[
				[
					artifactId: 'spring-petclinic',
					classifier:'',
					file:"target/spring-petclinic-${mavenPom.version}.jar",
					type:'jar'
				]
			],
			credentialsId:NEXUS_CREDENTIALS_ID,
			groupId:'org.springframework.samples',
			nexusUrl:NEXUS_URL,
			nexusVersion:NEXUS_VERSION,
			protocol:NEXUS_PROTOCOL,
			repository:NEXUS_REPOSITORY,
			version:"${mavenPom.version}"
			}
	       }
	}
	
   }
}
