terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
    user_name = "gdescalzo"
    tenant_name = "gdescalzo_project"
    password = "qjTWvdqdRYwvnWgx36iFiVUZ9fl"
    auth_url = "https://keystone.uy-south-1.public.ntycloud.net:5000/v3"
    region = "RegionOne"
    domain_name = "nty_testers"
}

resource "openstack_compute_instance_v2" "basic" {
    name = "basic"
    image_id = "65a7ea85-03cd-445f-aca2-76b7a74e55e7"
    flavor_id = "1"
    security_groups = ["default"]
    
    network {
        name = "internet"
    }
}