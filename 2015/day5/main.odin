package main

import "core:fmt"
import "core:strings"

part1 :: proc() {
	count := 0
	lines := strings.split_lines(INPUT)

	for line in lines {
		vowels := 0
		twice := 0
		nasty := false

		for char, index in line {
			if strings.contains_rune("aeiou", char) {
				vowels += 1
			}

			if index < len(line) - 1 && char == rune(line[index + 1]) {
				twice += 1
			}
		}

		forbidden := []string{"ab", "cd", "pq", "xy"}
		for value in forbidden {
			if strings.contains(line, value) {
				nasty = true
			}
		}

		is_nice_string := vowels >= 3 && twice >= 1 && !nasty
		if is_nice_string {
			count += 1
		}
	}

	fmt.println(count)
}

part2 :: proc() {
	count := 0
	lines := strings.split_lines(INPUT)

	for line in lines {
		pairs := 0
		repeat := 0

		pair_index := map[string]int{}; defer delete(pair_index)

		for char, index in line {
			if index < len(line) - 1 {
				pair := line[index:index + 2]

				if value, ok := pair_index[pair]; ok {
					if index - value >= 2 {
						pairs += 1
					}
				} else {
					pair_index[pair] = index
				}
			}

			if index < len(line) - 2 && char == rune(line[index + 2]) {
				repeat += 1
			}
		}

		is_nice_string := pairs >= 1 && repeat >= 1
		if is_nice_string {
			count += 1
		}
	}

	fmt.println(count)
}

main :: proc() {
	part1()
	part2()
}
