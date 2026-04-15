package main

import "core:fmt"
import "core:strconv"
import "core:strings"

part1 :: proc() {
	count := 0
	lines := strings.split_lines(INPUT)

	grid := make([]bool, 1000 * 1000); defer delete(grid)

	for line in lines {
		arguments := strings.split(line, " ")

		switch arguments[0] {
		case "turn":
			from := strings.split(arguments[2], ",")
			to := strings.split(arguments[4], ",")

			from_x, _ := strconv.parse_int(from[0])
			from_y, _ := strconv.parse_int(from[1])
			to_x, _ := strconv.parse_int(to[0])
			to_y, _ := strconv.parse_int(to[1])

			for x in from_x ..= to_x {
				for y in from_y ..= to_y {
					grid[x * 1000 + y] = arguments[1] == "on"
				}
			}
		case "toggle":
			from := strings.split(arguments[1], ",")
			to := strings.split(arguments[3], ",")

			from_x, _ := strconv.parse_int(from[0])
			from_y, _ := strconv.parse_int(from[1])
			to_x, _ := strconv.parse_int(to[0])
			to_y, _ := strconv.parse_int(to[1])

			for x in from_x ..= to_x {
				for y in from_y ..= to_y {
					grid[x * 1000 + y] = !grid[x * 1000 + y]
				}
			}
		}
	}

	for value in grid {
		if value {
			count += 1
		}
	}

	fmt.println(count)
}

part2 :: proc() {
	count := 0
	lines := strings.split_lines(INPUT)

	grid := make([]int, 1000 * 1000); defer delete(grid)

	for line in lines {
		arguments := strings.split(line, " ")

		switch arguments[0] {
		case "turn":
			from := strings.split(arguments[2], ",")
			to := strings.split(arguments[4], ",")

			from_x, _ := strconv.parse_int(from[0])
			from_y, _ := strconv.parse_int(from[1])
			to_x, _ := strconv.parse_int(to[0])
			to_y, _ := strconv.parse_int(to[1])

			for x in from_x ..= to_x {
				for y in from_y ..= to_y {
					if arguments[1] == "on" {
						grid[x * 1000 + y] += 1
					} else {
						if grid[x * 1000 + y] > 0 {
							grid[x * 1000 + y] -= 1
						}
					}
				}
			}
		case "toggle":
			from := strings.split(arguments[1], ",")
			to := strings.split(arguments[3], ",")

			from_x, _ := strconv.parse_int(from[0])
			from_y, _ := strconv.parse_int(from[1])
			to_x, _ := strconv.parse_int(to[0])
			to_y, _ := strconv.parse_int(to[1])

			for x in from_x ..= to_x {
				for y in from_y ..= to_y {
					grid[x * 1000 + y] += 2
				}
			}
		}
	}

	for value in grid {
		count += value
	}

	fmt.println(count)
}

main :: proc() {
	part1()
	part2()
}
