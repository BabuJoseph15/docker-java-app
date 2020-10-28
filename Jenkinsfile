node{
 stage('Scm Checkout'){
	 git credentialsId: 'git-creds', url: 'https://github.com/BabuJoseph15/docker-java-app.git'  
 }
 stage('Maven Package'){
	def mvnHome = tool name: 'maven3', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
 }
 stage('Build Docker Image'){
   withCredentials([usernameColonPassword(credentialsId: 'nexus', variable: 'dockerhub-pwd')]) {
      sh "docker login -u admin -p ${dockerhub-pwd} docker-repo:8083"
   }	   
   sh 'docker build . -t 3.19.27.239:8083/sampleapp'
   }
   stage('Push Docker Image'){
     withCredentials([usernameColonPassword(credentialsId: 'nexus', variable: 'dockerhub-pwd')]) {
        sh "docker login -u admin -p ${dockerhub-pwd} docker-repo:8083"
     }
     sh 'docker push http://3.19.27.239:8081/repository/docker-repo/sampleapp:1.0.0'
   }
 }
   
