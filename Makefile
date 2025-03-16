#!/bin/env make -f

NAME = simple-zram
VERSION := $(shell cat VERSION)

SRC = $(PWD)/src
BUILD_DIR = $(PWD)/build/$(NAME)_$(VERSION)

DEBIAN_DIR = $(BUILD_DIR)/DEBIAN
ETC_DIR = $(BUILD_DIR)/etc
USR_DIR = $(BUILD_DIR)/usr

.PHONY: all clean build

all: build install

debian:
	make build

	@echo "Creating debian package"

	@cp -av $(SRC)/debian/* $(DEBIAN_DIR)/

# Generate the changelog
	@git-changelog $(USR_DIR)/share/doc/$(NAME)/changelog.DEBIAN

# Set the package size
	@sed -i "s|Installed-Size:|Installed-Size: `du -s --block-size=1 $(BUILD_DIR) | cut -f1`|" \
		$(DEBIAN_DIR)/control

	@git-changelog $(DEBIAN_DIR)/changelog
	@gzip -d $(DEBIAN_DIR)/changelog.gz

# Set the package name and version
	@sed -i "s|Package:|Package: $(NAME)|" $(DEBIAN_DIR)/control
	@sed -i "s|Version:|Version: $(VERSION)|" $(DEBIAN_DIR)/control
	@sed -i "s|Maintainer:|Maintainer: $(shell git config user.name) <$(shell git config user.email)>|" \
		$(DEBIAN_DIR)/control

# Set permission for postinst and prerm
	@chmod 755 $(DEBIAN_DIR)/postinst $(DEBIAN_DIR)/prerm

# Create the MD5sums file omitting the DEBIAN directory
	@find $(BUILD_DIR)/etc -type f -exec md5sum {} \; > $(DEBIAN_DIR)/md5sums
	@find $(BUILD_DIR)/usr -type f -exec md5sum {} \; >> $(DEBIAN_DIR)/md5sums
	@sed -i "s|$(BUILD_DIR)/||" $(DEBIAN_DIR)/md5sums

# Set the package size


# Build the deb package
	@dpkg-deb --root-owner-group --build $(BUILD_DIR) build/$(NAME)_$(VERSION)_all.deb

build:
	@echo "Building $(NAME) $(VERSION)"

	@mkdir -pv $(DEBIAN_DIR) \
		$(ETC_DIR) \
		$(USR_DIR)/bin \
		$(USR_DIR)/lib/systemd/system \
		$(USR_DIR)/share/doc/$(NAME)

	@cp -av $(SRC)/$(NAME).conf $(ETC_DIR)/
	@cp -av $(SRC)/$(NAME).service $(USR_DIR)/lib/systemd/system/
	@cp -av ./COPYING $(USR_DIR)/share/doc/$(NAME)/
	@cp -av ./VERSION $(USR_DIR)/share/doc/$(NAME)/

	@cp -av $(SRC)/$(NAME) $(USR_DIR)/bin/
	@chmod 755 $(USR_DIR)/bin/$(NAME)

	@sed -i "s/VERSION=/VERSION=$(VERSION)/g" $(USR_DIR)/bin/$(NAME)

install:
	@make build

	@cp -a $(USR_DIR)/bin/$(NAME) /usr/bin/
	@cp -a $(ETC_DIR)/$(NAME).conf /etc/
	@cp -a $(USR_DIR)/lib/systemd/system/$(NAME).service /lib/systemd/system/

	@systemctl is-active --quiet $(NAME) && systemctl daemon-reload ||
		systemctl enable --now $(NAME)

uninstall:
	@systemctl is-active --quiet $(NAME) && systemctl disable --now $(NAME) || true
	@rm -f /usr/bin/$(NAME) /etc/$(NAME).conf /lib/systemd/system/$(NAME).service

clean:
	rm -Rfv build
