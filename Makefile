.PHONY: all run build clean get analyze test lint format

all: run

run:
	@echo "Running Flutter application..."
	flutter run

build:
	@echo "Building Flutter application..."
	flutter build apk

clean:
	@echo "Cleaning Flutter project..."
	flutter clean

get:
	@echo "Getting Flutter packages..."
	flutter pub get

analyze:
	@echo "Analyzing Flutter project..."
	flutter analyze

test:
	@echo "Running Flutter tests..."
	flutter test

lint: analyze
	@echo "Running Flutter linter (alias for analyze)..."

format:
	@echo "Formatting Flutter code..."
	flutter format .
