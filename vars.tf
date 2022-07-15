variable "amis" {
  type = map
  default = {
    "sa-east-1" = "ami-08ae71fd7f1449df1"
    "us-east-1" = "ami-052efd3df9dad4825"
  }
}

variable "cdir_remote_access" {
  type = list
  default = [
    "200.225.113.209/32"
  ]
}

variable "key_name" {
  default = "tmonteiro-aws"
}