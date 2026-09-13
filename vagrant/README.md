## Requirements

- [Vagrant](https://developer.hashicorp.com/vagrant/install)
<!-- search box here "http://app.vagrantup.com/boxes/search", or "https://portal.cloud.hashicorp.com/vagrant/discover?next=CgxXemN6T1RFek9WMD0%3D" -->
- Docker

## Commands

| Command                       | Description                                                        |
| ----------------------------- | ------------------------------------------------------------------ |
| `vagrant init` | Create a `vagrantfile` along with the vitrual machine. |
| `vagrant up --provider=docker` | Creates and starts the Nginx container defined in `Vagrantfile`. |
| `vagrant status`               | Shows the current state of the Vagrant-managed container.         |
| `vagrant ssh`               | ssh into the vatrual machine or go inside it. |
| `vagrant provision`            | Re-runs provisioning for the running container.                   |
| `vagrant halt`                 | Stops the container without removing it.                          |
| `vagrant destroy`              | Stops and removes the container.                                  |

## Access

Once the container is running, open <http://localhost:8080> to access Nginx.
