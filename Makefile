# $@ target
# @< first prereq
# @^ all prereq
# @? prereqs newer than target
# @* stem of target

default: all

MAKEFLAGS+="-j -l $(shell grep -c ^processor /proc/cpuinfo) "

SRC=$(wildcard *.src)
TARGETS=$(SRC:.src=.obj)

.PHONY: all doc clean
