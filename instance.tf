resource "aws_instance" "test" {
  
     ami = "ami-0ff8a91507f77f867"
     instance_type = "t2.micro"
     subnet_id = "${aws_subnet.mysubnet.id}"
     security_groups = ["${aws_security_group.mycustomgroup.id}"]     
     key_name    = "rootkey"
     user_data   = <<-EOF
		   #!/bin/bash
		  sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
                  sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
                  sudo yum install -y java-1.8.0-openjdk.x86_64
                  sudo /usr/sbin/alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
                  sudo /usr/sbin/alternatives --set javac /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/javac
	          sudo yum install -y jenkins
                  sudo service jenkins start
                  sudo yum-config-manager --enable epel
                  sudo yum install -y ansible
                  EOF
     tags {
      Name = "public_box"
        }
	

}
	

resource "aws_instance" "private" {
	ami = "ami-0ac019f4fcb7cb7e6"
	instance_type = "t2.micro"
	subnet_id = "${aws_subnet.myprivate.id}"
	security_groups = ["${aws_security_group.mycustomgroup.id}"]
	tags {
	 Name = "private_box"
	 }
	key_name = "rootkey"
}



