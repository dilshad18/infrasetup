resource "aws_instance" "public" {
  
     ami             = "ami-0ac019f4fcb7cb7e6"
     instance_type   = "t2.micro"
     subnet_id       = "${aws_subnet.public_subnet.id}"
     security_groups = ["${aws_security_group.security_group.id}"]     
     key_name        = "rootkey"
     user_data   = <<-EOF
		   #!/bin/bash
                  sudo add-apt-repository ppa:webupd8team/java -y
                  sudo apt-get update && sudo add-apt-repository ppa:webupd8team/java -y
                  wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
                  sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
                  sudo apt install  software-properties-common -y
                  sudo apt-add-repository ppa:ansible/ansible -y
                  sudo apt update && sudo apt install openjdk-8-jdk ansible jenkins -y
		   EOF
     tags {
         Name        = "public_box"
        }
	

}
	

resource "aws_instance" "private" {
	ami             = "ami-0ac019f4fcb7cb7e6"
	instance_type   = "t2.micro"
	subnet_id       = "${aws_subnet.private_subnet.id}"
	security_groups = ["${aws_security_group.security_group.id}"]
	user_data       = <<EOF
			  #!/bin/bash
			  sudo apt update
			  sudo apt install python -y
			  EOF
	tags {
	 Name           = "private_box"
	 }
	key_name        = "rootkey"
}



