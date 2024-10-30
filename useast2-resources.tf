
  resource "aws_vpc" "vpceast2"{
    cidr_block="40.0.0.0/16"
    provider=aws.useast2
    tags={
        name="vpceast2"
    }
  }
  resource "aws_subnet" "pubsubneteast2" {
  vpc_id     = "${aws_vpc.vpceast2.id}"
  cidr_block = "40.0.1.0/24"
  provider=aws.useast2

  tags = {
    Name = "pubsubneteast2"
  }
}

resource "aws_instance" "instanceeast2" {
  ami           = "ami-0ea3c35c5c3284d82"
  instance_type = "t2.micro"
  provider=aws.useast2
  subnet_id=aws_subnet.pubsubneteast2.id
    tags={
        name="ohio instance"
    }
  }
