pipeline {
    
 stages {
    agent any

     tools {
        maven "MAVEN3"
        jdk "JDK8"
     } 
    
     environment {
        dockeRepo="asia.gcr.io/hypnotic-camp-371708/vproapp"
        registrycredential="gcr:hypnotic-camp-371708"
        registryUrl="http://asia.gcr.io"
     }

     stages {

        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
     }

   }
}