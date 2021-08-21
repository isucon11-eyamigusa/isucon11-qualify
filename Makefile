.PHONY: bashrc
bashrc:
	rm -f /home/isucon/.bashrc
	ln -s /home/isucon/git/bashrc /home/isucon/.bashrc

.PHONY: restart-nginx
restart-nginx:
	sudo systemctl restart nginx
	sudo systemctl status nginx

.PHONY: restart-go
restart-go:
	sudo systemctl restart isucondition.go
	sudo systemctl status isucondition.go

.PHONY: sshconfig
sshconfig:
	ln -s ~/git/ssh_config ~/.ssh/config

.PHONY: nginx
nginx:
	sudo rm -f /etc/nginx/nginx.conf /etc/nginx/sites-available/isucondition.conf
	sudo ln -s /home/isucon/git/nginx/nginx.conf /etc/nginx/nginx.conf
	sudo ln -s /home/isucon/git/nginx/isucondition.conf /etc/nginx/sites-available/isucondition.conf

.PHONY: webapp
webapp:
	rm -rf /home/isucon/webapp
	ln -s /home/isucon/git/webapp /home/isucon/webapp

