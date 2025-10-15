# diet_tracker

A simple, fast, and focused Flutter app that helps users track their daily calories, weight, and weekly burn goals. It provides clear visual summaries, easy meal logging, and progress tracking — all through a clean, minimal interface designed to keep health management effortless and motivating.
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
