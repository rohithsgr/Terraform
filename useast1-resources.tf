resource "aws_instance" "instanceeast1" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  provider=aws.useast1
  subnet_id=aws_subnet.pubsubneteast1.id
  
  tags={
        name="virginia instance"
    }
  }

  resource "aws_vpc" "vpceast1" {
  cidr_block = "20.0.0.0/16"
  provider=aws.useast1
  tags={
    name="vpceast1"
  }
}

resource "aws_subnet" "pubsubneteast1" {
  vpc_id     = "${aws_vpc.vpceast1.id}"
  cidr_block = "20.0.1.0/24"

  tags = {
    Name = "pubsubneteast1"
  }
}
