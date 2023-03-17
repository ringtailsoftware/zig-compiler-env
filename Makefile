all:
	docker build -t zig-latest . && docker run -ti --rm -v ${PWD}:/zig zig-latest

