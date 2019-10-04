provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "CTE_DB_MN" {
	ami = "ami-07eece9374066bba7"
	instance_type = "r5.2xlarge"
	key_name = "ctestmt"
	security_groups = "${var.security_groups}"
	iam_instance_profile = "CTEEc2InstanceProfile"
	subnet_id = "subnet-0337ec7d3fbb316c7"


tags = {
	Name = "CTE_DB_MN"
	applicationid = "CTE"
	ansible_role = "pnpcust"
	version = "1"
	department = "CTE"
	env = "prod"
	}
}

resource "aws_ebs_volume" "XPPNP_snap" {
	availability_zone = "us-east-1a"
	snapshot_id = "snap-09fdbe59906907b9d"
        size = 40
        type = "gp2"

        tags =  {
                description = "ebs volume for the XPPNP DB"
                Name = "XPPNP"
        }
}
resource "aws_volume_attachment" "XPPNP-snap-attachment" {
        device_name = "/dev/xvdj"
        volume_id = "${aws_ebs_volume.XPPNP_snap.id}"
        instance_id = "${aws_instance.CTE_DB_MN.id}"
}


resource "aws_ebs_volume" "XISIS_snap" {
        availability_zone = "us-east-1a"
        snapshot_id = "snap-021b975d0cf96c8f3"
        size = 40
        type = "gp2"

        tags =  {
                description = "ebs volume for the XISIS DB"
                Name = "XISIS"
        }
}
resource "aws_volume_attachment" "XISIS-snap-attachment" {
        device_name = "/dev/xvdk"
        volume_id = "${aws_ebs_volume.XISIS_snap.id}"
        instance_id = "${aws_instance.CTE_DB_MN.id}"
}


resource "aws_ebs_volume" "XINST_snap" {
        availability_zone = "us-east-1a"
        snapshot_id = "snap-048b807d058649f18"
        size = 40
        type = "gp2"

        tags =  {
                description = "ebs volume for the XINST DB"
                Name = "XINST"
        }
}
resource "aws_volume_attachment" "XINST-snap-attachment" {
        device_name = "/dev/xvdl"
        volume_id = "${aws_ebs_volume.XINST_snap.id}"
        instance_id = "${aws_instance.CTE_DB_MN.id}"
}


resource "aws_ebs_volume" "XIN02_snap" {
        availability_zone = "us-east-1a"
        snapshot_id = "snap-0fd095e6387525c3b"
        size = 40
        type = "gp2"

        tags =  {
                description = "ebs volume for the XIN02 DB"
                Name = "XIN02"
        }
}
resource "aws_volume_attachment" "XIN02-snap-attachment" {
        device_name = "/dev/xvdm"
        volume_id = "${aws_ebs_volume.XIN02_snap.id}"
        instance_id = "${aws_instance.CTE_DB_MN.id}"
}

