package main

import "core:fmt"
import "core:math"
import "core:strconv"
import "core:strings"

part1 :: proc() {
	count := 0
	lines, _ := strings.split_lines(INPUT)

	for line in lines {
		values, _ := strings.split(line, "x")

		l, _ := strconv.parse_int(values[0])
		w, _ := strconv.parse_int(values[1])
		h, _ := strconv.parse_int(values[2])

		count += (2 * l * w) + (2 * w * h) + (2 * h * l)
		count += math.min(math.min(l * w, w * h), h * l)
	}

	fmt.println(count)
}

part2 :: proc() {
	count := 0
	lines, _ := strings.split_lines(INPUT)

	for line in lines {
		values, _ := strings.split(line, "x")

		l, _ := strconv.parse_int(values[0])
		w, _ := strconv.parse_int(values[1])
		h, _ := strconv.parse_int(values[2])

		minimum := math.min(math.min(l, w), h)
		maximum := math.max(math.max(l, w), h)
		median := l + w + h - minimum - maximum

		count += minimum * 2 + median * 2
		count += l * w * h
	}

	fmt.println(count)
}

main :: proc() {
	part1()
	part2()
}
