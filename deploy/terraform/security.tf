resource "aws_security_group" "contact_sg" {
  name = "contactbook_sg"
  description = "contact security group"
  vpc_id = aws_vpc.contact_vpc_3.id
}

resource "aws_security_group_rule" "sgr_pub_out" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.contact_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "srg_http_in" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.contact_sg.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "srg_ssh_in" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.contact_sg.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_key_pair" "contact_key" {
  key_name = "contactbook_key2"
  public_key = file("~/.ssh/contactbook_key2.pub")
}
