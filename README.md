# diet_tracker

A new Flutter project.
## 🌍 Localization

This project uses **easy_localization**.

### Generate locale files

```bash
dart run easy_localization:generate --source-dir ./assets/i18n/;dart run easy_localization:generate --source-dir ./assets/i18n -f keys -o locale_keys.g.dart
```

## ⚙️ Code Generation

Run build_runner to generate `.g.dart` and injectable/retrofit files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```