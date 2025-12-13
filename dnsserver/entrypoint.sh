#!/bin/bash
#chmod a+x safsdadfs
rsyslogd

named -g -u bind "$@"
