#!/bin/bash
# @copyright 2021 Network RADIUS SAS (legal@networkradius.com)
# Author: Jorge Pereira <jorge@freeradius.org>
##

if [ -z "$CI_TEST_USER" ]; then
	echo "$0: ERROR: Missing the env CI_TEST_USER"
	exit 1
fi

if [ -z "$CI_TEST_PASS" ]; then
	echo "$0: ERROR: Missing the env CI_TEST_PASS"
	exit 1
fi

# Setup the basic user setting
if [ -f /etc/redhat-release ]; then
	cp -f redhat/pam_sshd_example /etc/pam.d/sshd
else
	cp -f debian/pam_sshd_example /etc/pam.d/sshd
fi

cat > /etc/pam_radius_auth.conf <<EOF
# Generated by $0
[::1]         testing123  5
127.0.0.1     testing123  5
EOF
