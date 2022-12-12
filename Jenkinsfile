pipeline {
    agent any

	environment {

		   registry = "ghazichhida/ExamThourayaS2"

        registryCredential = 'dockerhub'

        dockerImage = ''

        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "192.168.16.203:8081"
        NEXUS_REPOSITORY = "maven-releases"
        NEXUS_CREDENTIAL_ID = "nexus-user-credentials"
    }


    stages {
        stage('Checkout Git') {
            steps {
                echo 'Pulling ...';
                git branch : 'main',
                // Get some code from a GitHub repository
                url: 'https://github.com/Chhidaghazi/DEVOPSS.git'


            }
        }


        stage("Maven Build") {
            steps {
                script {
                    sh "mvn clean install -DskipTests"
                }
            }
        }

        stage('MVN COMPILE') {
            steps {
               sh' mvn compile'

            }
         }

		  stage("Unit tests") {
            steps {
                  sh "mvn test"
            }
         }

         stage('MVN SONARQUBE') {
                     steps {
                         sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=esprit'
                     }
                 }

  stage('NexuS')
 {
  steps{
        echo "nexus"
        sh 'mvn clean '
       sh ' mvn deploy -DskipTests'
         }
       }



//                      stage('Building our image') {
//                   			steps {
//                   				script {
//                   					dockerImage = docker.build registry + ":$BUILD_NUMBER"
//                   					}
//                   				}
//                   		}
//
//
//
//
//
//
//
// 	    stage('Deploy our image') {
//                            steps {
//                            script {
//                                docker.withRegistry( '', registryCredential ) {
//                                dockerImage.push()
//                                  }
//                               }
//                             }
//
//                           }
//
//  stage       ('DOCKER COMPOSE') {
//              steps {
//                 sh 'docker-compose up -d '
//             }
//         }




    }

}
