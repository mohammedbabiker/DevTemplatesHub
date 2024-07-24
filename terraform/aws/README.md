## After all done its time to execute

| First Header                   | Second Header                                                              |
| ------------------------------ | -------------------------------------------------------------------------- |
| `terraform init`               | Initializes configuration, downloading plugins and setting up backend.     |
| `terraform fmt`                | Formats configuration files.                                               |
| `terraform validate`           | Checks for syntax and structural errors.                                   |
| `terraform plan -out plan.out` | Creates a plan showing changes to infrastructure.                          |
| `terraform apply plan.out`     | Applies the configuration, creating/modifying resources with confirmation. |
| `terraform destroy`            | Destroys all resources managed by the configuration.                       |
