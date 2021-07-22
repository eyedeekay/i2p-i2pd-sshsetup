
index: header body css footer

body:
	@echo "<!DOCTYPE html>" > index.html
	@echo "<html>" >> index.html
	@echo "<head>" >> index.html
	@echo "  <title>Universal SSH over I2P Instructions</title>" >> index.html
	@echo "  <link rel=\"stylesheet\" type=\"text/css\" href=\"home.css\" />" >> index.html
	@echo "</head>" >> index.html
	@echo "<body>" >> index.html
	pandoc README.md >> index.html
	@echo "</body>" >> index.html
	@echo "</html>" >> index.html

rst:
	@echo '.. meta::' | tee README.rst
	@echo '    :author: idk' | tee -a README.rst
	@echo '    :date: 2019-06-14' | tee -a README.rst
	@echo '    :excerpt: Offering an I2P Mirror' | tee -a README.rst
	@echo '' | tee -a README.rst
	torst README.md | tee -a README.rst

blog:
	mkdir -p $(HOME)/Workspace/desktop-Workspace/mtn/i2p.www/i2p2www/blog/2019/06/14
	cp README.rst $(HOME)/Workspace/desktop-Workspace/mtn/i2p.www/i2p2www/blog/2019/06/14/i2p-i2pd-ssh-config.rst
	cp _static/images/*.png $(HOME)/Workspace/desktop-Workspace/mtn/i2p.www/i2p2www/static/images


header:
	rm -f index.html
	@echo '<!DOCTYPE html>' | tee -a index.html
	@echo '<html>' | tee -a index.html
	@echo '<head>' | tee -a index.html
	@echo '  <title>Configuring an SSH server on i2p</title>' | tee -a index.html
	@echo ' </head>' | tee -a index.html
	@echo '<body>' | tee -a index.html

footer:
	@echo '</body>' | tee -a index.html
	@echo '</html>' | tee -a index.html

css:

network=si
samhost=sam-host
samport=7656
args=-r

docker-volume:
	docker run -i -t -d \
		--name sshsetup-volume \
		--volume sshsetup:/home/eephttpd/ \
		eyedeekay/eephttpd; true
	make docker-copy
	docker stop eephttpd-volume; true

docker-run: docker-volume
	docker rm -f eephttpd; true
	docker run -i -t -d \
		--network $(network) \
		--env samhost=$(samhost) \
		--env samport=$(samport) \
		--env args=$(args) \
		--network-alias sshsetup \
		--hostname sshsetup \
		--name sshsetup \
		--restart always \
		--volumes-from sshsetup-volume \
		eyedeekay/eephttpd
	make docker-copy
	docker logs -f sshsetup

docker-copy:
	docker cp ./ sshsetup-volume:/opt/eephttpd/www/; true
	docker cp ./ sshsetup:/opt/eephttpd/www/; true

visit:
	http_proxy=http://127.0.0.1:44443 surf http://566niximlxdzpanmn4qouucvua3k7neniwss47li5r6ugoertzuq.b32.i2p
