package main

import "core:fmt"

part1 :: proc() {
	count := 0

	for character in INPUT {
		switch character {
		case '(':
			count += 1
		case ')':
			count -= 1
		}
	}

	fmt.println(count)
}

part2 :: proc() {
	count := 0

	for character, index in INPUT {
		if count == -1 {
			fmt.println(index)
			break
		}

		switch character {
		case '(':
			count += 1
		case ')':
			count -= 1
		}
	}
}

main :: proc() {
	part1()
	part2()
}
