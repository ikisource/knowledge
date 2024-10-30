# GitLab

## Installation on Ubuntu

`sudo apt-get update`

`apt install ca-certificates postfix -y
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash`

`apt install gitlab-ce -y`

`nano /etc/gitlab/gitlab.rb`

`set external_url 'http:/192.168.0.7:88'`

`gitlab-ctl reconfigure`

`cat /etc/gitlab/initial_root_password` (copier le mot de passe)

dans le navigateur lancer l'url http:/192.168.0.7:88
et se logger avec root/mot_de_passe_copié (UeANDdQockyOIMsurAHyRlkJ6IsY4tdN1DAvly94HG8=)

https://www.atlantic.net/dedicated-server-hosting/how-to-install-gitlab-ce-on-ubuntu-22-04/