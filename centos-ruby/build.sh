#!/bin/bash

(docker build -t openshift/centos-ruby .)
(cd ../centos-ruby-builder && docker build -t openshift/centos-ruby-builder .)
