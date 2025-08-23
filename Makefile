.PHONY: all run build clean get analyze test lint format build_runner_watch build_runner_build l10n copy-db upload-android-firebase

all: run

run:
	@echo "Running Flutter application..."
	flutter run --flavor local

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

build_runner_watch:
	@echo "Running Flutter build_runner in watch mode..."
	flutter packages pub run build_runner watch --delete-conflicting-outputs

build_runner_build:
	@echo "Running Flutter build_runner to build..."
	flutter packages pub run build_runner build --delete-conflicting-outputs

build_mocks:
	@echo "Generating mocks..."
	flutter pub run build_runner build --delete-conflicting-outputs

l10n:
	@echo "Generating localization files..."
	flutter gen-l10n

copy-db:
	@echo "Copying database from device..."
	adb shell 'run-as net.satoyan.qr_scanner_demo.local cat /data/data/net.satoyan.qr_scanner_demo.local/app_flutter/db.sqlite' > db.sqlite

upload-android-firebase:
	@echo "Building Android release APK..."
	flutter build apk --profile --flavor dev
	@echo "Uploading to Firebase App Distribution..."
	firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk --app $(FIREBASE_APP_ID_DEV) --groups "testers"
