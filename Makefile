d_valid:
	dmd -run d/main.d
.PHONY: d_valid

d_invalid:
	sh ./expect_invalid.sh "dmd -version=invalidPromises -run d/main.d" "invalid promises: stdio foobar"
.PHONY: d_invalid

nim_valid:
	nim c --hints:off -r nim/main.nim
.PHONY: nim_valid

nim_invalid:
	sh ./expect_invalid.sh "nim c -d:invalidPromises --hints:off -r nim/main.nim" "invalid promises: stdio foobar"
.PHONY: nim_invalid

zig_valid:
	pushd zig && \
		zig build && \
		popd
.PHONY: zig_valid

zig_invalid:
	pushd zig && \
		zig build -DinvalidPromises=true && \
		popd
.PHONY: zig_invalid

valid: d_valid nim_valid zig_valid
.PHONY: valid

invalid: d_invalid nim_invalid zig_invalid
.PHONY: invalid