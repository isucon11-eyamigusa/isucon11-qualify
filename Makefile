.PHONY: restart-nginx
restart-nginx:
	sudo systemctl restart nginx
	sudo systemctl status nginx

.PHONY: sshconfig
sshconfig:
	ln -s ~/git/ssh_config ~/.ssh/config

.PHONY: nginx
nginx:
	sudo rm -f /etc/nginx/nginx.conf /etc/nginx/sites-available/isucondition.conf
	sudo ln -s /home/isucon/git/nginx/nginx.conf /etc/nginx/nginx.conf
	sudo ln -s /home/isucon/git/nginx/isucondition.conf /etc/nginx/sites-available/isucondition.conf
	

