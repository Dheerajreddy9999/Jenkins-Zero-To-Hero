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

      stage('Deploy Image To GCR') {
         steps {
            script {
               docker.withRegistry(registryUrl,registryCredential) {
                  dockerImage.push("v$BUILD_NUMBER")
               }
            }
         }
      }

      stage('Remove Unused Image') {
         steps {
            sh 'docker rmi $dockerRepoName:V$BUILD_NUMBER'
         }
      }

      stage('CODE ANALYSIS with SONARQUBE') {

            environment {
                scannerHome = tool 'mysonarscanner'
            }

            steps {
                withSonarQubeEnv('sonar-pro') {
                    sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vprofile \
                   -Dsonar.projectName=vprofile-repo \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
                }
           }
      } 




   }
}