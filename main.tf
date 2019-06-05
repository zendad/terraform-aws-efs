resource "aws_efs_file_system" "efs" {
  creation_token   = "${var.name}-c${var.cluster_num}"
  performance_mode = "${var.performance_mode}"
  encrypted        = "true"

  tags {
    Name        = "${var.name}-c${var.cluster_num}"
    Environment = "${var.environment}"
    Cluster     = "${var.cluster_num}"
    Terraform   = "true"
  }
}

resource "aws_efs_mount_target" "efs" {
  count           = "${length(var.subnets)}"
  file_system_id  = "${aws_efs_file_system.efs.id}"
  subnet_id       = "${element(var.subnets, count.index)}"
  security_groups = ["${aws_security_group.efs.id}"]
}

resource "aws_security_group" "efs" {
  name        = "${var.name}-efs-c${var.cluster_num}"
  description = "Allow NFS traffic."
  vpc_id      = "${var.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }

  ingress {
    from_port   = "2049"
    to_port     = "2049"
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_cidr_blocks}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.name}-c${var.cluster_num}"
    Environment = "${var.environment}"
    Cluster     = "${var.cluster_num}"
    Terraform   = "true"
  }
}