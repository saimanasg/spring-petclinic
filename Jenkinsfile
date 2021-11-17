pipeline{
   agent any
   environment{
	NEXUS_VERSION="nexus3"
	NEXUS_PROTOCOL="http"
	NEXUS_URL="localhost:8081"
	NEXUS_REPOSIORY="repo_name"
	NEXUS_CREDENTIAL_ID="Nexus_ID"
       }
   stages{
	stage('Checkout')
	{
	  checkout([
			$class:'GitSCM',
			branches:[[name:'*/master']],
			extensions:[],
			userRemoteConfigs:[[credentialsId:'github_id',url:'https://github.com/sample/sample.git']]
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
		-Dsonar.login= Sonarqube_Token'''
	       }
	}
	stage('Uploading Nexus Artifact')
	{
	  steps{
		script{
			def mavenPom=readMavenPom file:'pom.xml'
			nexusArtifactUploader artifacts:[
				[
					artifactId: 'Sample-Java-Project',
					classifier:'',
					file:"target/Sample-Java-Project-${mavenPom.version}.jar",
					type:'jar'
				]
			],
			credentialsId:NEXUS_CREDENTIALS_ID,
			groupId:'com.cg.trg',
			nexusUrl:NEXUS_URL,
			nexusVersion:NEXUS_VERSION,
			protocol:NEXUS_PROTOCOL',
			repository:NEXUS_REPOSITORY,
			version:"${mavenPom.version}"
			}
	       }
	}
	
   }
}
