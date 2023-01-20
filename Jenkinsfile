pipeline {
    agent any
    tools {
	    maven "MAVEN3"
	    jdk "JDK8"
	}

   environment {
      dockerRepoName = "asia.gcr.io/hypnotic-camp-371708/vprofile-app"
      registryCredential = "gcr:hypnotic-camp-371708"
      registryUrl = "http://asia.gcr.io"
   }

    stages{

        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }

    }
}