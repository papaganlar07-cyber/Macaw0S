SHELL := /usr/bin/env bash
PREFIX ?= /usr/local
STAGE ?= .stage/macaw0s

.PHONY: validate validate-compatibility validate-tricore validate-usability test-aviary test-macawctl test-aaa-music test-aviary-settings install-aviary stage-freebsd clean

validate: validate-compatibility validate-tricore validate-usability test-aviary test-macawctl test-aaa-music test-aviary-settings

validate-compatibility:
	./scripts/validate-compatibility.sh

validate-tricore:
	./scripts/validate-tricore.sh

validate-usability:
	./scripts/validate-usability.sh

test-aviary:
	./scripts/test-aviary-components.sh

test-macawctl:
	./scripts/test-macawctl.sh

test-aaa-music:
	./scripts/test-aaa-music.sh

test-aviary-settings:
	./scripts/test-aviary-settings.sh

install-aviary:
	./scripts/install-aviary-desktop.sh "$(PREFIX)"

stage-freebsd:
	rm -rf "$(STAGE)"
	./installer/freebsd/postinstall.sh "$(STAGE)"
	./scripts/install-aviary-desktop.sh "$(STAGE)/usr/local"

clean:
	rm -rf .stage .mkarchiso-work .build-*-packages.txt .build-*-services.txt
