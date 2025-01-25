# Variables
APP_NAME := api
BUILD_DIR := ./cmd/$(APP_NAME)
BUILD_OUTPUT := $(BUILD_DIR)/$(APP_NAME)
MIGRATE := migrate
DB_URL := $(GREENLIGHT_DB_DSN)

# Targets
.PHONY: all build run migrate-up migrate-down clean

# Default target
all: build run

# Build the application
build:
	go build -o $(BUILD_OUTPUT) $(BUILD_DIR)

# Run the application
run: build
	$(BUILD_OUTPUT)

# Apply database migrations (up)
migrate-up:
	$(MIGRATE) -path ./migrations -database "$(DB_URL)" up

# Rollback the latest database migration (down)
migrate-down:
	$(MIGRATE) -path ./migrations -database "$(DB_URL)" down

migrate-create:
	@echo "Enter migration name: " && \
	read name && \
	$(MIGRATE) create -seq -ext=.sql -dir=migrations $$name

# Clean up build artifacts
clean:
	rm -f $(BUILD_OUTPUT)
