andrew@Andrews-MacBook-Pro custom_vpc % terraform plan   

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.dav_ec2_by_tf will be created
  + resource "aws_instance" "dav_ec2_by_tf" {
      + ami                                  = "ami-0fc5d935ebf8bc3bc"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = "us-east-1a"
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name"  = "dav-ec2-vpc-by-tf"
          + "Owner" = "Andrew DL"
        }
      + tags_all                             = {
          + "Name"  = "dav-ec2-vpc-by-tf"
          + "Owner" = "Andrew DL"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "7d182e6b2f94a1f8bcc00bb685378a352e09c8d4"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_internet_gateway.staging-igw will be created
  + resource "aws_internet_gateway" "staging-igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "dav-igw"
        }
      + tags_all = {
          + "Name" = "dav-igw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route_table.staging-rt will be created
  + resource "aws_route_table" "staging-rt" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = ""
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = "::/0"
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "dav-public-rt"
        }
      + tags_all         = {
          + "Name" = "dav-public-rt"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.subnet-rt-as will be created
  + resource "aws_route_table_association" "subnet-rt-as" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.dav-sg-tf will be created
  + resource "aws_security_group" "dav-sg-tf" {
      + arn                    = (known after apply)
      + description            = "Allow WEB and ADM inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = [
                  + "::/0",
                ]
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "dav-sg-tf"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name"  = "dav-allow-web-access"
          + "Owner" = "Andrew DL"
        }
      + tags_all               = {
          + "Name"  = "dav-allow-web-access"
          + "Owner" = "Andrew DL"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.staging-subnet-1 will be created
  + resource "aws_subnet" "staging-subnet-1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "dav-staging-subnet"
        }
      + tags_all                                       = {
          + "Name" = "dav-staging-subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.staging-vpc will be created
  + resource "aws_vpc" "staging-vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "dav-vpc"
        }
      + tags_all                             = {
          + "Name" = "dav-vpc"
        }
    }

Plan: 7 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
andrew@Andrews-MacBook-Pro custom_vpc % terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.dav_ec2_by_tf will be created
  + resource "aws_instance" "dav_ec2_by_tf" {
      + ami                                  = "ami-0fc5d935ebf8bc3bc"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = "us-east-1a"
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name"  = "dav-ec2-vpc-by-tf"
          + "Owner" = "Andrew DL"
        }
      + tags_all                             = {
          + "Name"  = "dav-ec2-vpc-by-tf"
          + "Owner" = "Andrew DL"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "7d182e6b2f94a1f8bcc00bb685378a352e09c8d4"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_internet_gateway.staging-igw will be created
  + resource "aws_internet_gateway" "staging-igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "dav-igw"
        }
      + tags_all = {
          + "Name" = "dav-igw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route_table.staging-rt will be created
  + resource "aws_route_table" "staging-rt" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = ""
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = "::/0"
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "dav-public-rt"
        }
      + tags_all         = {
          + "Name" = "dav-public-rt"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.subnet-rt-as will be created
  + resource "aws_route_table_association" "subnet-rt-as" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.dav-sg-tf will be created
  + resource "aws_security_group" "dav-sg-tf" {
      + arn                    = (known after apply)
      + description            = "Allow WEB and ADM inbound traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = [
                  + "::/0",
                ]
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "dav-sg-tf"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name"  = "dav-allow-web-access"
          + "Owner" = "Andrew DL"
        }
      + tags_all               = {
          + "Name"  = "dav-allow-web-access"
          + "Owner" = "Andrew DL"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.staging-subnet-1 will be created
  + resource "aws_subnet" "staging-subnet-1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "dav-staging-subnet"
        }
      + tags_all                                       = {
          + "Name" = "dav-staging-subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.staging-vpc will be created
  + resource "aws_vpc" "staging-vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "dav-vpc"
        }
      + tags_all                             = {
          + "Name" = "dav-vpc"
        }
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.staging-vpc: Creating...
aws_vpc.staging-vpc: Creation complete after 4s [id=vpc-00891bbeb2d07b985]
aws_internet_gateway.staging-igw: Creating...
aws_subnet.staging-subnet-1: Creating...
aws_security_group.dav-sg-tf: Creating...
aws_subnet.staging-subnet-1: Creation complete after 1s [id=subnet-030bb1ede4bebcb8d]
aws_internet_gateway.staging-igw: Creation complete after 1s [id=igw-009552543b39836f8]
aws_route_table.staging-rt: Creating...
aws_security_group.dav-sg-tf: Creation complete after 4s [id=sg-0062297319f402a15]
aws_instance.dav_ec2_by_tf: Creating...
aws_route_table.staging-rt: Creation complete after 3s [id=rtb-046903c2f3e69abe1]
aws_route_table_association.subnet-rt-as: Creating...
aws_route_table_association.subnet-rt-as: Creation complete after 1s [id=rtbassoc-0fd0fef33f1636072]
aws_instance.dav_ec2_by_tf: Still creating... [10s elapsed]
aws_instance.dav_ec2_by_tf: Creation complete after 14s [id=i-02a15fa182b0d6ad3]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.
andrew@Andrews-MacBook-Pro custom_vpc % 
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.
andrew@Andrews-MacBook-Pro custom_vpc % terraform apply
aws_vpc.staging-vpc: Refreshing state... [id=vpc-00891bbeb2d07b985]
aws_internet_gateway.staging-igw: Refreshing state... [id=igw-009552543b39836f8]
aws_subnet.staging-subnet-1: Refreshing state... [id=subnet-030bb1ede4bebcb8d]
aws_security_group.dav-sg-tf: Refreshing state... [id=sg-0062297319f402a15]
aws_route_table.staging-rt: Refreshing state... [id=rtb-046903c2f3e69abe1]
aws_instance.dav_ec2_by_tf: Refreshing state... [id=i-02a15fa182b0d6ad3]
aws_route_table_association.subnet-rt-as: Refreshing state... [id=rtbassoc-0fd0fef33f1636072]

Changes to Outputs:
  + av-ec2-vpc-by-tf          = "i-02a15fa182b0d6ad3"
  + av-ec2-vpc-by-tf-PublicIP = "54.242.89.235"
  + av-ec2-vpc-by-tf-VPC-Id   = "vpc-00891bbeb2d07b985"

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

av-ec2-vpc-by-tf = "i-02a15fa182b0d6ad3"
av-ec2-vpc-by-tf-PublicIP = "54.242.89.235"
av-ec2-vpc-by-tf-VPC-Id = "vpc-00891bbeb2d07b985"
andrew@Andrews-MacBook-Pro custom_vpc % 