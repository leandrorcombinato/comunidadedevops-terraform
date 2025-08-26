## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.8.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 3.0.2 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.38.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_aws_load_balancer_controller"></a> [eks\_aws\_load\_balancer\_controller](#module\_eks\_aws\_load\_balancer\_controller) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/cluster | n/a |
| <a name="module_eks_manager_node_group"></a> [eks\_manager\_node\_group](#module\_eks\_manager\_node\_group) | ./modules/manager-node-group | n/a |
| <a name="module_eks_network"></a> [eks\_network](#module\_eks\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name for tagging resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca"></a> [ca](#output\_ca) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.48.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.8.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.17.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_aws_load_balancer_controller"></a> [eks\_aws\_load\_balancer\_controller](#module\_eks\_aws\_load\_balancer\_controller) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/cluster | n/a |
| <a name="module_eks_manager_node_group"></a> [eks\_manager\_node\_group](#module\_eks\_manager\_node\_group) | ./modules/manager-node-group | n/a |
| <a name="module_eks_network"></a> [eks\_network](#module\_eks\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Networking CIDR block to used for the VPC | `string` | n/a | yes |
| <a name="input_oidc"></a> [oidc](#input\_oidc) | HTTPS URL from OIDC provider of the EKS cluster | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name to used to name the resources (Name tag) | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region to create the resources | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all AWS resources | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca"></a> [ca](#output\_ca) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
<!-- END_TF_DOCS -->