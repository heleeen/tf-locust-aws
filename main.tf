#########################
# EC2
#########################
resource "aws_instance" "locust" {
  ami                    = "${ var.ami_id }"
  instance_type          = "${ var.instance_type }"
  key_name               = "${ var.key_name }"
  vpc_security_group_ids = ["${ aws_security_group.locust.id }"]
  subnet_id              = "${ var.subnet_id }"
  iam_instance_profile   = "${ aws_iam_instance_profile.locust_profile.name }"

  user_data = "${ data.template_file.user_data.rendered }"

  tags = {
    Name = "${ var.name }-session-manager"
  }
}

data "template_file" "user_data" {
  template = "${ file("${path.module}/init_instance.sh") }"
}

#########################
# Security Group
#########################
resource "aws_security_group" "locust" {
  vpc_id = "${ var.vpc_id }"
  name   = "${ var.name }-locust-sg"

  tags {
    Name = "${ var.name }-locust-sg"
  }
}

resource "aws_security_group_rule" "locust_ingress" {
  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocustks = ["${ var.trusted_cidr_blocks }"]

  security_group_id = "${ aws_security_group.locust.id }"
}

resource "aws_security_group_rule" "locust_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocustks = ["0.0.0.0/0"]

  security_group_id = "${ aws_security_group.locust.id }"
}
