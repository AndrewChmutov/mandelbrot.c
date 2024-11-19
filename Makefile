CC        := gcc
CFLAGS    := -Wall -Wextra -O2 -I'./include/'
LDFLAGS   :=

BUILD_DIR := build
SRC_DIR   := src
OBJ_DIR   := $(BUILD_DIR)/obj

SRC       := $(wildcard $(SRC_DIR)/*.c)
OBJS      := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

TARGET    := $(BUILD_DIR)/mandelbrot

.PHONY: all
all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)
