package main

import "core:fmt"

part1 :: proc() {
	houses: [dynamic][2]int; defer delete(houses)
	append(&houses, [2]int{0, 0})

	position := [2]int{0, 0}

	for character in INPUT {
		switch character {
		case '^':
			position.y += 1
		case '>':
			position.x += 1
		case '<':
			position.x -= 1
		case 'v':
			position.y -= 1
		}

		match := false
		for element in houses {
			if element == position {
				match = true
				break
			}
		}

		if !match {
			append(&houses, position)
		}
	}

	fmt.println(len(houses))
}

part2 :: proc() {
	houses: [dynamic][2]int; defer delete(houses)
	append(&houses, [2]int{0, 0})

	position_a := [2]int{0, 0}
	position_b := [2]int{0, 0}

	current_position: ^[2]int

	for character, index in INPUT {
		if index % 2 == 0 {
			current_position = &position_a
		} else {
			current_position = &position_b
		}

		switch character {
		case '^':
			current_position.y += 1
		case '>':
			current_position.x += 1
		case '<':
			current_position.x -= 1
		case 'v':
			current_position.y -= 1
		}

		match := false
		for element in houses {
			if element == current_position^ {
				match = true
				break
			}
		}

		if !match {
			append(&houses, current_position^)
		}
	}

	fmt.println(len(houses))
}

main :: proc() {
	part1()
	part2()
}
