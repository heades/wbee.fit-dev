SITE=_site
REPO=~/website/wbee.fit
DEV_REPO=~/website/wbee.fit-dev

EXCLUDES=Makefile

# Build
all :
	bundle exec jekyll build --watch

# Serve development	
serve :
	cd ${SITE} && python3 -m http.server

# Push to production:
push :
	bundle exec jekyll build 
	rsync -a --exclude ${EXCLUDES} ${SITE}/* ${REPO}/.	
	cd ${REPO} && git add . && git commit -a -m 'Updating the website.' && git push
