# Ansible

This directory contains Ansible inventory examples, configuration files, and
playbooks for managing remote Linux hosts.

## Requirements

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- SSH access to the hosts in `hosts.yaml`
- Python 3 on each managed host

Check that Ansible is installed:

```bash
ansible --version
```

## Inventory

Edit [`hosts.yaml`](./hosts.yaml) with the host addresses, SSH user, and
private key for your environment. The inventory groups hosts as `master` and
`workers`, so those group names can be used in commands and playbooks.

Test the inventory and connection:

```bash
ansible-inventory -i hosts.yaml --graph
ansible all -i hosts.yaml -m ping
```

The `ping` module does not send an ICMP packet. It connects over SSH, runs a
small Python check, and returns `pong` when the host is reachable and ready for
Ansible.

## Ad-hoc module commands

Run these commands from this directory. Replace `all` with `master`,
`workers`, or a specific host when needed.

### Ping

Check connectivity to every host:

```bash
ansible all -i hosts.yaml -m ansible.builtin.ping
```

### Copy

Copy a local file to every managed host:

```bash
ansible all -i hosts.yaml -m ansible.builtin.copy \
  -a "src=./files/example.conf dest=/tmp/example.conf mode=0644"
```

Copy content without creating a local source file:

```bash
ansible all -i hosts.yaml -m ansible.builtin.copy \
  -a "content='Managed by Ansible\n' dest=/tmp/managed-by-ansible.txt mode=0644"
```

Use `--become` when the destination requires elevated privileges:

```bash
ansible all -i hosts.yaml -b -m ansible.builtin.copy \
  -a "src=./files/example.conf dest=/etc/example.conf owner=root group=root mode=0644"
```

### Shell

Run a shell command on every managed host:

```bash
ansible all -i hosts.yaml -m ansible.builtin.shell \
  -a "uname -a"
```

Run a command with a specific working directory:

```bash
ansible all -i hosts.yaml -m ansible.builtin.shell \
  -a "chdir=/var/tmp pwd && ls -la"
```

Use `shell` only when shell features such as pipes, redirection, or
environment expansion are required. Prefer a dedicated module (for example,
`command`, `service`, or `ansible.builtin.apt`) when one is available.

## Running playbooks

The reusable playbooks are in [`playbook/`](./playbook/). Run them from this
directory and provide the inventory explicitly:

```bash
ansible-playbook -i hosts.yaml playbook/install-nginx.yaml
ansible-playbook -i hosts.yaml playbook/install-docker.yaml
ansible-playbook -i hosts.yaml playbook/install-vim.yaml
ansible-playbook -i hosts.yaml playbook/install-zsh.yaml
ansible-playbook -i hosts.yaml playbook/update-package.yaml
ansible-playbook -i hosts.yaml playbook/update-timezone.yaml
ansible-playbook -i hosts.yaml playbook/check-disk-space.yaml
```

Preview changes before applying them:

```bash
ansible-playbook -i hosts.yaml playbook/install-nginx.yaml --check
```

The playbooks that use `become: true` require a user with appropriate
privileges. Add `-K` if Ansible must prompt for the become password:

```bash
ansible-playbook -i hosts.yaml playbook/install-nginx.yaml -K
```

## Project layout

| Path | Description |
| --- | --- |
| [`hosts.yaml`](./hosts.yaml) | Example inventory for remote hosts |
| [`ansible.cfg`](./ansible.cfg) | Example Ansible configuration |
| [`playbook/`](./playbook/) | Standalone task-oriented playbooks |
| [`devOps-project/`](./devOps-project/) | Role-based project with `setup.yaml` |

Do not commit real IP addresses, credentials, or private keys to the
repository. Keep environment-specific values in a private inventory or
Ansible Vault.
