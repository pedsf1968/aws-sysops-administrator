# Only for AMI Linux 2 not for 2023
sudo amazon-linux-extras install epel -y
sudo yum install stress -y

sudo stress -c 4
 
#Run stress for 5mins

sudo stress --cpu 1 --timeout 320