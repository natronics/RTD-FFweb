all: build

build: index.md
	jekyll build

index.md: index.ipynb
	jupyter nbconvert --execute --to=markdown --template="nb-markdown.tpl" $^
