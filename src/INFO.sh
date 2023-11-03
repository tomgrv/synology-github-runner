#!/bin/bash
# Copyright (c) 2000-2016 Synology Inc. All rights reserved.

source . /pkgscripts/include/pkg_util.sh

package="GithubRunner"

version="1.0.0000"

displayname="Github Runner"

maintainer="tomgrv"

arch="$(pkg_get_unified_platform)"

description="Github Runner for Synology NAS"

[ "$(caller)" != "0 NULL" ] && return 0

pkg_dump_info
