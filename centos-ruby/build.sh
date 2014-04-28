#!/bin/bash

(cd base && docker build -t openshift/centos-ruby .)
(cd extended && docker build -t openshift/centos-ruby-extended .)
