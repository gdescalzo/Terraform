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
    user_name = "SomUserName"
    tenant_name = "SomeProjectName"
    password = "SomePassword"
    auth_url = "SomeURL"
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