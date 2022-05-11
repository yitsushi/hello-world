new-release:
ifndef VERSION
	$(error "VERSION is not defined")
endif
	git tag -s $(VERSION) -m $(VERSION)
	git push --tags
	docker build -t ghcr.io/yitsushi/hello-world:$(VERSION) .
	docker push ghcr.io/yitsushi/hello-world:$(VERSION)
