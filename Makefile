.PHONY: sshconfig
sshconfig:
	ln -s ~/git/ssh_config ~/.ssh/config

.PHONY: nginx
	rm /etc/nginx/nginx.conf /etc/nginx/sites-available/isucondition.conf
	ln -s ~/git/nginx/nginx.conf /etc/nginx/nginx.conf
	ln -s ~/git/nginx/isucondition.conf /etc/nginx/sites-available/isucondition.conf
	

