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
          sh "pwd"
          //sh "sudo docker build -t my-flask-app ." 
          
          
   }
   }



    stage('Deploy') {
       
       steps {
          sh "sudo docker rm --force my-flask-app"         
          //sh "sudo docker run -p 5004:5005 --name my-flask-app -d my-flask-app"
          //sh "sudo docker ps"
          sh "pwd"
          sh "ls"
          sh "terraform init"
          sh "terraform destroy --auto-approve"         
          sh "terraform apply --auto-approve"
          sh "terraform output -json > /var/tmp/appIPAddress.txt"
          sh "sudo cat /var/tmp/appIPAddress.txt | jq '.instance_ip_addr.value' | jq '.[]' > /var/tmp/appIPAddress2.txt"
          sh "ansible --version"
          sh "ansible -i /var/tmp/appIPAddress2.txt all --list-hosts"       
          
   }      
   }   
     }  // End of stages
 
} // End of pipeline