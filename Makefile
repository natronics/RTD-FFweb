all: build

build: index.md
	jekyll build

README.markdown: index.ipynb
	jupyter nbconvert --execute --to=markdown --template="nb-readme.tpl" $^
	mv index.md README.markdown

index.md: README.markdown
	jupyter nbconvert --execute --to=markdown --template="nb-jekyll.tpl" index.ipynb

clean:
	rm -f index.md README.markdown
	rm -rf _site
