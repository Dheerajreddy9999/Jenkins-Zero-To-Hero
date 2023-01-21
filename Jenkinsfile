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

        stage('BUILD') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
      }

      stage('UNIT TEST') {
         steps {
            sh 'mvn test'
         }
      }

      stage('INTEGRATION TEST') {
         steps {
            sh 'mvn verify -DskipUnitTests'
         }      
      }

      stage('CODE ANALYSIS WITH CHECKSTYLE') {
         steps {
            script {
               sh 'mvn checkstyle:checkstyle'
            }
         }
      }

      stage('Building Image') {
         steps {
            script {
               dockerImage = docker.build dockerRepoName + ":V$BUILD_NUMBER"
            }
         }
      }




   }
}