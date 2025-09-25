FILE := $(abspath $(CURFILE))
EXT  := $(suffix $(FILE))
NAME := $(basename $(notdir $(FILE)))
DIR  := $(dir $(FILE))

all:
	@if [ "$(EXT)" = ".c" ]; then \
		echo "Compiling C file: $(FILE)"; \
		gcc -Wall -Wextra -O2 "$(FILE)" -o "$(DIR)$(NAME)" && ./$(DIR)$(NAME); \
	elif [ "$(EXT)" = ".cpp" ]; then \
		echo "Compiling C++ file: $(FILE)"; \
		g++ -std=c++17 -Wall -Wextra -O2 "$(FILE)" -o "$(DIR)$(NAME)" && ./$(DIR)$(NAME); \
	elif [ "$(EXT)" = ".py" ]; then \
		echo "Running Python file: $(FILE)"; \
		python3 "$(FILE)"; \
	elif [ "$(EXT)" = ".rs" ]; then \
		echo "Compiling Rust file: $(FILE)"; \
		rustc "$(FILE)" -o "$(DIR)$(NAME)" && ./$(DIR)$(NAME); \
	elif [ "$(EXT)" = ".java" ]; then \
		echo "Compiling Java file: $(FILE)"; \
		javac "$(FILE)" && java -cp "$(DIR)" "$(NAME)"; \
	elif [ "$(EXT)" = ".sh" ]; then \
		echo "Running shell script: $(FILE)"; \
		chmod +x "$(FILE)" && ./"$(FILE)"; \
	else \
		echo "Unsupported file type: $(EXT). Supported: .c, .cpp, .py, .rs, .java, .sh"; \
	fi

clean:
	@if [ -n "$(CURFILE)" ]; then \
		FILE := $(abspath $(CURFILE)); \
		EXT  := $(suffix $$FILE); \
		NAME := $(basename $(notdir $$FILE)); \
		DIR  := $(dir $$FILE); \
		if [ "$$EXT" = ".c" ] || [ "$$EXT" = ".cpp" ] || [ "$$EXT" = ".rs" ]; then \
			rm -f "$(DIR)$$NAME"; \
		elif [ "$$EXT" = ".java" ]; then \
			rm -f "$(DIR)$$NAME.class"; \
		fi; \
	else \
		echo "No CURFILE specified for clean."; \
	fi

