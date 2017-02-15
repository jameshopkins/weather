SHELL:=/bin/bash
UI_DEPS=./elm-stuff ./node_modules
TEST_DEPS=./tests/elm-stuff ./node_modules

# Check for global dependencies and install them if necessary

check-elm-install:
	@type elm >/dev/null 2>&1 || npm i -g elm@0.18.0

check-yarn-install:
	@type yarn >/dev/null 2>&1 || npm i -g yarn

./node_modules: check-yarn-install
	yarn

./tests/elm-stuff: check-elm-install
	cd tests && elm-package install -y

./elm-stuff: check-elm-install
	elm-package	install -y

build: $(UI_DEPS)
	yarn build && cp src/index.html public

run: build
	yarn start

test: $(TEST_DEPS)
	yarn test

.PHONY: \
	check-elm-install \
	check-yarn-install \
	run \
	test \
