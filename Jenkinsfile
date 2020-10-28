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
   sh 'docker build . -t 18.222.180.174:8083/sampleapp'
 }
   stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'nexus')]) {
        sh "docker login -u admin -p ${nexus}"
     }
     sh 'docker push http://18.222.180.174:8081/repository/docker-repo/sampleapp:1.0.0'
   }
 }
   
