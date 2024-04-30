
resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"
  description = "Security group for EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22 # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 80 # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  # Define egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
}
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]  
  }
  filter {
  name   = "virtualization-type"
  values = ["hvm"]  
}
  filter {
  name   = "architecture"
  values = ["x86_64"]  
}
  owners = ["099720109477"]
}

resource "aws_instance" "ansible-proj" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t2.medium"              
  subnet_id = aws_subnet.public1.id
  key_name = "maro"
  root_block_device{
    volume_size = 15 
  }
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
}
