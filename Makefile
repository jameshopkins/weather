SHELL:=/bin/bash
UI_DEPS=./ui/elm-stuff ./ui/node_modules
SERVER_DEPS=./server/node_modules
SHARED_DEPS=./node_modules
TEST_DEPS=./ui/tests/elm-stuff ./node_modules

./ui/node_modules:
	cd ./ui && yarn

./ui/tests/elm-stuff:
	cd ui/tests && elm-package install -y

./ui/elm-stuff:
	cd ui && elm-package install -y

build-ui:
	cd ./ui && yarn build

$(SHARED_DEPS):
	yarn

$(SERVER_DEPS):
	cd ./server && yarn

run: build-ui
	yarn start

deps: $(SHARED_DEPS) $(SERVER_DEPS) $(UI_DEPS) $(TEST_DEPS)

test-ui:
	cd ./ui && yarn test

test-server:
	cd ./server && yarn test

test: test-ui test-server

.PHONY: \
	build-ui \
	check-elm-install \
	check-yarn-install \
	run \
	deps \
	test \
	test-ui \
	test-server \
