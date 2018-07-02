# Simple Terraform example to create and manage resources in a collaborative approach in Alibaba Cloud

## Remote State
By default Terraform stores the statefile locally on the machine from where the `terraform apply` command was run.  This poses a problem when attempting to run Terraform in a CI or collaborative environment.  To solve this problem Terraform has a feature called [Remote State](https://www.terraform.io/docs/state/remote.html).  

While there is not a specific backend for the Alibaba cloud provider, the Alibaba cloud Object Storage Service has a `S3` compatible API which allows the use of this provider.

### Leveraging remote state in Alibaba Cloud
When using remote state Terraform will store the state file in a bucket inside OSS, before we can use remote state we first need to create a bucket in your Alibaba Cloud account.   

We can then add the backend configuration for Terraform.  

```hcl
terraform {
  backend "s3" {
    bucket   = "tfstate"
    key      = "simpledemo/terraform.tfstate"
    region   = "us-east-1"
    endpoint = "https://oss-eu-central-1.aliyuncs.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}
```

We specify the bucket which was created in the previous step, the key which is the location to store our state inside the OSS bucket and the endpoint for the bucket.  

`region` can be set to any value as it is a required parameter but will be ignored by the operation, the final 5 options are to disable the specific `s3` checks used by the `s3 SDK`, these are not required when using the Alibaba OSS.

Running `terraform init` will setup the remote state in `OSS` and if a local state file exists then it will ask you if you would like to migrate your state to OSS.


## Workspaces
State in Terraform by default is global across branches of your configuration, this causes problems when you wish to use a branching approach to manage multiple environments in your infrastructure (dev, test, prod).  To enable multiple environment support we can use a feature of Terraform called [Workspaces](https://www.terraform.io/docs/state/workspaces.html).

The example CI configuration for CircleCI which can be found in the folder [.circleci/config.yml](.circleci/config.yml) takes an approach that the branch name of the repository corresponds to a workspace.  For example should you have a branch `dev` then you would also create a workspace dev `terraform workspace new dev`.  This ensures that changes to the configuration made in the `dev` branch does not modify the infrastructure related to the `master` branch which would happen if workspaces were not used.
