package main

import "core:crypto/legacy/md5"
import "core:fmt"

part1 :: proc() {
	count := 0
	ctx := md5.Context{}

	for {
		hash: [md5.DIGEST_SIZE]byte

		key := fmt.aprintf("%s%d", INPUT, count); defer delete(key)

		md5.init(&ctx)
		md5.update(&ctx, transmute([]u8)key)
		md5.final(&ctx, hash[:])

		if hash[0] == 0 && hash[1] == 0 && (hash[2] & 0xF0) == 0 {
			fmt.println(count)
			break
		}

		count += 1
	}
}

part2 :: proc() {
	count := 0
	ctx := md5.Context{}

	for {
		hash: [md5.DIGEST_SIZE]byte

		key := fmt.aprintf("%s%d", INPUT, count); defer delete(key)

		md5.init(&ctx)
		md5.update(&ctx, transmute([]u8)key)
		md5.final(&ctx, hash[:])

		if hash[0] == 0 && hash[1] == 0 && hash[2] == 0 {
			fmt.println(count)
			break
		}

		count += 1
	}
}

main :: proc() {
	part1()
	part2()
}
