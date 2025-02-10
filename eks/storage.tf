#resource "aws_ebs_volume" "videoprocessor_volume" {
#  availability_zone = "us-east-1c"
#  size              = 20
#  type              = "gp2"
#
#  tags = {
#    Name = "videoprocessor_volume"
#  }
#}
#
#resource "aws_volume_attachment" "videoprocessor_volume" {
#  device_name = "/dev/xvdf"
#  volume_id   = aws_ebs_volume.videoprocessor_volume.id
#  instance_id = aws_instance.videoprocessor_volume.id
#}
#
#resource "aws_instance" "videoprocessor_volume" {
#  ami           = "ami-070ee37f2c1386fd6" # Substitua pela AMI correta
#  instance_type = "t2.micro"
#
#  subnet_id = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.region}e"][0]
#
#  tags = {
#    Name = "videoprocessor_volume_instance"
#  }
#}