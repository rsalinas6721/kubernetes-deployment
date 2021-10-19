#! /bin/bash
sudo apt-get update
sudo apt-get upgrade

# Install K3S
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

# Install HELM
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm