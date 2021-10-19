variable "k3s-vars" {
  default = {
    "master" :{
      "hostname" : "master",
      "boot": "bootstrap/m.sh"
    },
    "master" :{
      "hostname" : "worker-1",
      "boot": "bootstrap/m.sh"
    }
  }
}

resource "aws_instance" "k3s-deployment" {
  ami           =  var.image
  instance_type = var.node-size
  for_each = var.k3s-vars
  tags = {
    Name = each.value.hostname
  }
  associate_public_ip_address = true
  key_name = var.key-name
  subnet_id = var.subnet
  user_data = file(each.value.boot)

}