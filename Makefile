BUILD_DIR := ./build
SRC_DIR := ./src
EXEC := locksmith

$(BUILD_DIR)/$(EXEC): $(SRC_DIR)/*.mad
	mkdir -p $(dir $@)
	echo "compiling! - locksmith"
	madlib compile -i src/Cli.mad -t llvm -o $@
	echo "built! - locksmith"

version.lock:
	madlib install

README.md: madlib.json
	pilcrow -i README.md --repo brekk/locksmith --auto

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
