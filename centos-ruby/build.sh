#!/bin/bash

(cd base && docker build -t mfojtik/centos-ruby:base .)
(cd extended && docker build -t mfojtik/centos-ruby:extended .)
