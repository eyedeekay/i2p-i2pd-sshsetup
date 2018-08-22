
index: header body css footer

body:
	markdown README.md | tee -a index.html

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
	@echo '<style>' | tee -a index.html
	@echo 'body {' | tee -a index.html
	@echo '    background-color: linen;' | tee -a index.html
	@echo '}' | tee -a index.html
	@echo 'h1 {' | tee -a index.html
	@echo '    margin-left: 40px;' | tee -a index.html
	@echo '}' | tee -a index.html
	@echo 'img {' | tee -a index.html
	@echo '    align: center;' | tee -a index.html
	@echo '}' | tee -a index.html
	@echo '</style>' | tee -a index.html

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
	http_proxy=http://127.0.0.1:44443 surf 566niximlxdzpanmn4qouucvua3k7neniwss47li5r6ugoertzuq.b32.i2p
