resource "aws_efs_file_system" "efs" {
  creation_token = "my-efs"
  tags = {
    Name = "puc-trabalho"
  }
}

resource "aws_efs_mount_target" "mount" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.this.id
  security_groups = [aws_security_group.sg-web.id]
}

resource "null_resource" "configure_nfs" {
  depends_on = [aws_efs_mount_target.mount]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    #private_key = tls_private_key.my_key.private_key_pem
    #public_key = var.aws_public_key
    host     = aws_instance.this.public_ip
  }
}
