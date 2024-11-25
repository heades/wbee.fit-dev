SITE=_site
REPO=~/website/wbee.fit
DEV_REPO=~/website/wbee.fit-dev

all :
	bundle exec jekyll build 
	cp -R ${SITE}/* ${REPO}/.	
	cd ${REPO} && git add . && git commit -a -m 'Updating the website.' && git push
