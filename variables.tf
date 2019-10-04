##variable "region " {
##    description = "AWS Region"
##    default     = "us-east-1"
##}

variable "key_name" {
    description = "CTE IAM key"
    default     = "CTE-Prod"
}

variable "ami" {
    type        = "map"
    description = "A map of AMIs"
    default     = {}
}

variable "instance_type" {
    description = "The instance type to launch"
    default     = "t2.large"
}
//variable "kms_id" {
//	description = "The kms id to secure snapshots"
//	default = "arn:aws:kms:us-east-1:745078641086:key/6a4b9921-572e-4b02-8cea-d0e74ba2a9dd"
//}

variable "vpc_id" {
    description = "The default VPC"
    default     = "vpc-00e607d1c5a180ed1"
}
//variable "snapshot_ids" {
//	description = "The default snapshot_id"
//	default = "snap-09fdbe59906907b9d"
//}
variable "security_groups" {
    type        = "list"
    description = "list of security groups"
    default    =  ["sg-0cb99980dc7ec876c", "sg-014f50ea6bacfc4a8", "sg-0bd9088d949dccacb", "sg-0931fd9395dbfa19d", "sg-0e0e5c0987d0d7428", "sg-0eaf79f3d2adc18b5", "sg-00e323df770d3c2f8", "sg-0926a07c1ec5ee133", "sg-0f7a129dccfc14da4"]
}

# variable "combinedname" {
#     description = "Oracle SID and Customer ID combined to one liner name"
#     default     = "$TF_VAR_instance_id"

