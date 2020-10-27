node{
 stage('Scm Checkout'){
	 git credentialsId: 'git-creds', url: 'https://github.com/BabuJoseph15/my-app.git'  
 }
 stage('Maven Package'){
	def mvnHome = tool name: 'maven3', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
 }
 stage('Build Docker Image'){
   sh 'docker build -t admin/sampleapp:1.0.0 .'
 }
   stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'nexus')]) {
        sh "docker login -u admin -p ${nexus}"
     }
     sh 'docker push http://3.19.27.239:8081/repository/docker-repo/sampleapp:1.0.0'
   }
 }
   
