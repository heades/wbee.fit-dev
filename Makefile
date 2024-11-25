TMP=/tmp/wbee.fit_staging_area
REPO=~/website/wbee.fit
DEV_REPO=~/website/wbee.fit-dev

all :
	mkdir ${TMP}
	cd ${DEV_REPO}
	bundle exec jekyll build --destination ${TMP}
	cp -R ${TMP}/* ${REPO}/.
	rm -rf ${TMP}
	cd ${REPO}
	git add .
	git commit -a -m 'Updating the website.'
	git push
