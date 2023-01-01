<b>Jenkins pipeline. </b>

pipeline creates a docker build, push to remote container repository , and deploy container to kubernetes cluster.

<hr><br>

<b>Terraform : </b><br><br>

 1 - Terraform configuration file that creates an EC2 instance running Linux, installs Apache web server on port 80, 
 assigns a fixed Elastic IP, and adds a security group that allows incoming traffic only from a specific IP address
 
 2- To expose the EC2 instance from Part A to the internet,  use an AWS Network Load Balancer (NLB). Here is a sample 
 configuration that creates an NLB and adds the EC2 instance as a target
 
 <hr><br>
 <b>Kubernetes</b> <br><br>
 K8S configuration that runs Deployment with multiple replicas and also creates a service with a load balancer on port 443<br>
 
 <hr><br>
 
 <b>Docker + Node "Hello World" Example</b>
  
  The project is a Hello Word application in the programming language JS-script with a dockerfile , ability 
  to later create a docker container. The application is launched by a web server that allows you to connect through 
  the browser on the specified port<br><br>
  
  Commands for creating a docker container:<br>
 <b>docker build -t hello-world .<br>
  docker run -d -p 4001:4000 hello-world </b>

