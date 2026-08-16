# SSH Remote Server Setup

## About the project
A project to setup a basic remote linux server VM on Vagrant and configure it to allow secure SSH.

## Repotree


## Specification
1. Provision a Ubuntu 22.04 LTS virtual machine using Vagrant with automatic SSH key deployment.
2. Configure SSH daemon to use Ed25519 public key authentication and disable password-based login.
3. Disable root login and ensure proper permissions on SSH configuration directories and files.
4. Install and enable fail2ban to protect against brute-force SSH attacks.
5. Automate the entire setup process through Vagrant provisioning scripts for reproducible server deployment.

## Commands
Install and configure fail2ban to prevent brute force attacks.
```bash
sudo apt update
sudo apt install fail2ban -y
sudo systemctl enable --now fail2ban
```

## Project URL: https://roadmap.sh/projects/ssh-remote-server-setup