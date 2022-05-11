new-release:
ifndef VERSION
	$(error "VERSION is not defined")
endif
	git tag -s $(VERSION) -m $(VERSION)
	git push --tags
