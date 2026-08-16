Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  # Include both your custom Ed25519 key and the initial insecure fallback key
  config.ssh.private_key_path = [
    "~/.ssh/vagrant_ed25519",
    "~/.vagrant.d/insecure_private_key"
  ]
  config.ssh.insert_key = false

  # Read the Ed25519 public key from the host
  ed25519_pub = File.read(File.expand_path("~/.ssh/vagrant_ed25519.pub")).strip

  config.vm.provision "shell", inline: <<-SHELL
    set -e

    # Deploy the Ed25519 key to authorized_keys
    mkdir -p /home/vagrant/.ssh
    echo "#{ed25519_pub}" > /home/vagrant/.ssh/authorized_keys
    chmod 700 /home/vagrant/.ssh
    chmod 600 /home/vagrant/.ssh/authorized_keys
    chown -R vagrant:vagrant /home/vagrant/.ssh

    # Secure SSH daemon configuration
    sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
    sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
    sed -i 's/^#*PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config

    # Restart SSH service
    systemctl restart sshd || service ssh restart

    SHELL
    
    config.vm.provision "shell", path: "scripts/script.sh"
end
