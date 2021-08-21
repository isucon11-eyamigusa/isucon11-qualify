.PHONY: sshconfig
sshconfig:
	ln -s ~/git/ssh_config ~/.ssh/config

.PHONY: nginx
nginx:
	rm -f /etc/nginx/nginx.conf /etc/nginx/sites-available/isucondition.conf
	ln -s /home/isucon/git/nginx/nginx.conf /etc/nginx/nginx.conf
	ln -s /home/isucon/git/nginx/isucondition.conf /etc/nginx/sites-available/isucondition.conf
	

