pipeline{

    agent any
    tools{
    maven 'Maven3.8.6'
        }
        triggers{
        pollSCM('* * * * *')
        }
    options{
    buildDiscarder(logRotator(artifactDaysToKeepStr: '5', artifactNumToKeepStr: '5', daysToKeepStr: '5', numToKeepStr: '5'))
    }
    stages{
        
      stage('CheckOutCode'){
        steps{
            sendslacknotifications("STARTED")
            git credentialsId: 'githubcredentials', url: 'https://github.com/rakhidevops1/maven-web-application-Jenkins.git'
    	}
      } //closing checkout
      stage('Build'){
        steps{
            sendslacknotifications("BUILDINGWARPACKAGE")
             sh  "mvn clean package"
    	}
      } //closing Build
      stage('ExecuteSonarQubeReport'){
        steps{
            sendslacknotifications("RUNNINGSONAR")
             sh  "mvn clean sonar:sonar"
    	}
      }//closing ExecuteSonarQubeReport
      stage('UploadArtifactsIntoNexus'){
        steps{
            sendslacknotifications("UPLOADINGARTIFACTS")
             sh  "mvn clean deploy"
    	}
      }//closing UploadArtifactsIntoNexus
      stage('DeployAppIntoTomcat'){
      steps{
          
        sshagent(['tomcatCredentialsForSCP']) {
                  sendslacknotifications("DEPLOYINGTOTOMCAT") 
                   sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.24.225:/opt/apache-tomcat-9.0.68/webapps/"  
                }
      }
      }//closing DeployAppIntoTomcat
    }//stages closing
    post{
        aborted{
            sendslacknotifications(currentBuild.result)
        }
        success{
            sendslacknotifications(currentBuild.result)
        }
        failure{
            sendslacknotifications(currentBuild.result)
        }
    }
    
    }//pipeline closing
    
    def sendslacknotifications(String buildStatus = 'STARTED') {
      // build status of null means successful
      buildStatus =  buildStatus ?: 'SUCCESS'
    
      // Default values
      def colorName = 'RED'
      def colorCode = '#FF0000'
      def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
      def summary = "${subject} (${env.BUILD_URL})"
    
      // Override default values based on build status
      if (buildStatus == 'STARTED') {
        colorName = 'YELLOW'
        colorCode = '#FFFF00'
      }else if (buildStatus == 'CLONING') {
        colorName = 'BLUE'
        colorCode = '#0B1CEC'
      }else if (buildStatus == 'BUILDINGWARPACKAGE') {
        colorName = 'ORANGE'
        colorCode = '#F6990B'
      }else if (buildStatus == 'RUNNINGSONAR') {
        colorName = 'CYAN'
        colorCode = '#0EF6C8'
      }else if (buildStatus == 'UPLOADINGARTIFACTS') {
        colorName = 'DARKGREEN'
        colorCode = '#3B9119'
      }else if (buildStatus == 'DEPLOYINGTOTOMCAT') {
        colorName = 'PINK'
        colorCode = '#EC0AE1'
      }else if (buildStatus == 'SUCCESS') {
        colorName = 'GREEN'
        colorCode = '#00FF00'
      } else {
        colorName = 'RED'
        colorCode = '#FF0000'
      }
    
      // Send notifications
      slackSend (color: colorCode, message: summary, channel: "#walmart-uat")
    }
