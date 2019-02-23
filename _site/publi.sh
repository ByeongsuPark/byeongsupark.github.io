git checkout site
rm -rf _site/
JEKYLL_ENV=production bundle exec jekyll build 
git add --all
git commit -m "`date`"
git push origin site
git subtree push --prefix=_site/ master
