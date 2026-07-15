# -----------------------------
# ELEGOO-NFC-Tool Project Setup
# -----------------------------

Write-Host "Creating ELEGOO-NFC-Tool folder in OneDrive..."

$oneDrive = "/Users/wmcnaught/OneDrive"
$projectRoot = Join-Path $oneDrive "ELEGOO-NFC-Tool"

# Create root directory
New-Item -ItemType Directory -Force -Path $projectRoot | Out-Null

# Subdirectories
$folders = @(
    "lib",
    "lib\screens",
    "lib\services",
    "lib\widgets",
    ".github",
    ".github\workflows",
    ".github\ISSUE_TEMPLATE"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path (Join-Path $projectRoot $folder) | Out-Null
}

Write-Host "Folder structure created."

# -----------------------------
# Create essential project files
# -----------------------------

# .gitignore
@"
# Flutter
build/
.dart_tool/
.packages
pubspec.lock

# Android
local.properties

# iOS
Pods/
.build/
"@ | Set-Content "$projectRoot\.gitignore"

# LICENSE
@"
MIT License

Copyright (c) 2026

Permission is hereby granted...
"@ | Set-Content "$projectRoot\LICENSE"

# README.md
@"
# ELEGOO NFC Tool (Flutter)

A fully featured NFC Tool for NTAG213 + ELEGOO EPC256 support.
Automatic cloud backup, encryption, presets, and scheduled tasks.

See documentation for usage.
"@ | Set-Content "$projectRoot\README.md"

# CONTRIBUTING.md
@"
# Contributing
Please format code using: flutter format .
Run tests: flutter test
"@ | Set-Content "$projectRoot\CONTRIBUTING.md"

# GitHub Workflows (CI + Release + Lint)
@"
name: Build APK (CI)
on:
  push:
    branches: [ 'main' ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: subosito/flutter-action@v2
      with:
        channel: stable
    - run: flutter pub get
    - run: flutter build apk --release
    - uses: actions/upload-artifact@v4
      with:
        name: app-release.apk
        path: build/app/outputs/flutter-apk/app-release.apk
"@ | Set-Content "$projectRoot\.github\workflows\build_apk.yml"

@"
name: Release APK
on:
  push:
    tags:
      - 'v*.*.*'
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: subosito/flutter-action@v2
      with:
        channel: stable
    - run: flutter pub get
    - run: flutter build apk --release
    - uses: softprops/action-gh-release@v2
      with:
        files: build/app/outputs/flutter-apk/app-release.apk
"@ | Set-Content "$projectRoot\.github\workflows\release_apk.yml"

@"
name: Flutter Lint & Static Analysis
on:
  push:
    branches: [ 'main' ]
  pull_request:
    branches: [ 'main' ]
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: subosito/flutter-action@v2
    - run: flutter pub get
    - run: flutter analyse
    - run: flutter format --set-exit-if-changed .
"@ | Set-Content "$projectRoot\.github\workflows\lint.yml"

Write-Host "GitHub CI workflows added."

# NOTE: This script creates structure + base files.
# You will insert the generated Dart source files next.

Write-Host "ELEGOO-NFC-Tool project setup completed in OneDrive."
