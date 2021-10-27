# terraform-ansible

### Being used to deploy IAC.

Terraform is deploying machines at AWS using credentials saved in aws-cli. After setting up proper tags in the machines, they're filtered by Ansible's Dynamic Inventory. This inventory allow both Terraform and Ansible to work together in a clear way.

To debug, use: 
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ./playbooks/master.yml -i terraform.aws_ec2.yml -u ubuntu --key-file ~/.ssh/keypair-aws.pem
```