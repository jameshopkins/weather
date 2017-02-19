SHELL:=/bin/bash
UI_DEPS=./ui/elm-stuff ./ui/node_modules
SERVER_DEPS=./server/node_modules
SHARED_DEPS=./node_modules
TEST_DEPS=./ui/tests/elm-stuff ./node_modules

# Check for global dependencies and install them if necessary

check-elm-install:
	@type elm >/dev/null 2>&1 || npm i -g elm@0.18.0

check-yarn-install:
	@type yarn >/dev/null 2>&1 || npm i -g yarn

./ui/node_modules: check-yarn-install
	cd ./ui && yarn

./ui/tests/elm-stuff: check-elm-install
	cd ui/tests && elm-package install -y

./ui/elm-stuff: check-elm-install
	cd ui && elm-package install -y

build-ui: $(SHARED_DEPS) $(UI_DEPS)
	cd ./ui && yarn build

$(SHARED_DEPS):
	yarn

$(SERVER_DEPS): check-yarn-install
	cd ./server && yarn

run: build-ui $(SHARED_DEPS) $(SERVER_DEPS)
	yarn start

test-ui: $(UI_DEPS)
	cd ./ui && yarn test

test-server: $(SHARED_DEPS) $(SERVER_DEPS)
	cd ./server && yarn test

test: test-ui test-server

.PHONY: \
	build-ui \
	check-elm-install \
	check-yarn-install \
	run \
	test \
	test-ui \
	test-server \
