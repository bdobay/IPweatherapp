pipeline {
   
   agent any //{label 'slave_linux'}
    stages {
        
    //stage('Checkout SCM')   {
        
      //  steps {
      //git ('https://github.com/bdobay/IPweatherapp')
      //if (!fileExists("Dockerfile")) {
        // error('Dockerfile missing.')  

    stage('Build') {
       
       steps {       
          sh "sudo docker build -t my-flask-app ."
          
   }
   }

    stage('Test') {
       
       steps {
          sh "sudo docker rm --force my-flask-app"         
          sh "sudo docker run -p 5003:5005 --name my-flask-app -d my-flask-app"
   }      
   }

    stage('Deploy') {
       
       steps {
          //sh "sudo docker rm --force my-flask-app"         
          //sh "sudo docker run -p 5003:5005 --name my-flask-app -d my-flask-app"
          sh "sudo docker ps" 
   }      
   }   
     }  // End of stages
 
} // End of pipeline