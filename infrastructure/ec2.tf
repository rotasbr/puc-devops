resource "aws_key_pair" "this" {
  key_name   = "${local.prefix}-key"
  public_key = var.aws_public_key
}

resource "aws_instance" "this" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = var.aws_instance_type
  count                       = 1
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.sg-web.id]
  subnet_id              = aws_subnet.this.id
  tags = merge(
    local.common_tags,
    {
      Name = "${local.prefix}-site"
    }
  )
}

