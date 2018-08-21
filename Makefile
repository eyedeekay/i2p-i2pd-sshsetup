
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

