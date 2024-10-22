
##  ------------
##@ Presentation
##  ------------

presentation: ## Start the presentation web server
	@docker run --rm -p 1948:1948 -p 35729:35729 -v $(shell pwd)/Presentation:/slides webpronl/reveal-md:latest /slides --watch
.PHONY: presentation

presentation-w-notes: ## Start the presentation web server (with notes)
	@docker run --rm -p 1948:1948 -p 35729:35729 -v $(shell pwd)/Presentation:/slides webpronl/reveal-md:latest /slides --scripts print-format.js --watch
.PHONY: presentation-w-notes

##  -------------
##@ Documentation
##  -------------

export-pdf: clean ## Export presentation to pdf (used in GH action)
	@mv Presentation/print-options.json Presentation/reveal.json
	@docker run -d -p 1948:1948 -v $(shell pwd)/Presentation:/slides --name reveal-md webpronl/reveal-md:latest /slides
	@mkdir generation_tmp && sudo chmod 777 generation_tmp
	@sleep 5
	@docker run --rm -t --net=host -v $(shell pwd)/generation_tmp:/slides astefanutti/decktape reveal -s 2048x1536 http://localhost:1948/slides_EN.md slides_EN.pdf
	@mv -f generation_tmp/slides_EN.pdf Presentation/doc/slides_EN.pdf
	@make clean
	@mv Presentation/reveal.json Presentation/print-options.json
.PHONY: export-pdf

##  ----
##@ Misc
##  ----

prepare:
	@npm install @semantic-release/exec -D
	@npm install @semantic-release/changelog -D
	@npm install @semantic-release/git -D
.PHONY: prepare

clean: ## Clean docker image
	@docker stop reveal-md || true
	@docker rm reveal-md || true
	@rm -rf generation_tmp || true
.PHONY: clean

.DEFAULT_GOAL := help
APPLICATION_TITLE := Dependency-track presentation \n ================
.PHONY: help
# See https://www.thapaliya.com/en/writings/well-documented-makefiles/
help: ## Display this help
	@awk 'BEGIN {FS = ":.* ##"; printf "\n\033[32;1m ${APPLICATION_TITLE}\033[0m\n\n\033[1mUsage:\033[0m\n  \033[31mmake \033[36m<option>\033[0m\n"} /^[%a-zA-Z_-]+:.* ## / { printf "  \033[33m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' ${MAKEFILE_LIST}

##@
