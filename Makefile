.PHONY: install
install:
	pdm install

.PHONY: docs
docs:
	pdm run mkdocs serve

.PHONY: build-docs
build-docs:
	pdm run mkdocs build --strict
