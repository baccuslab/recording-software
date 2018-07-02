#!/bin/bash

function main() {
	for DIR in "$(find . -type d -depth 1)"; do
		make -C "$DIR"
	done
}

main
