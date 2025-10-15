import 'package:colorize/colorize.dart';

import 'package:flutter/foundation.dart';

class Dev {
  Dev._();

  static bool _enabled = kDebugMode;

  /// استدعاء بالبداية من startApp
  static void configure({required bool enabled}) {
    _enabled = enabled;
  }

  static bool get isEnabled => _enabled;
  static set isEnabled(bool v) => _enabled = v;

  static void _out(String message) {
    debugPrint(message);
  }

  static void logValue(dynamic value) {
    if (!_enabled) return;
    final msg = Colorize(
      "The value is : ******  $value  ******",
    ).magenta().red().bold().italic().initial;
    _out(msg);
  }

  static void logError(dynamic value) {
    if (!_enabled) return;
    final msg = Colorize(
      "The Error is : ******  $value  ******",
    ).bgRed().white().bold().italic().initial;
    _out(msg);
  }

  static void logLine(dynamic value) {
    if (!_enabled) return;
    final msg = Colorize(
      "******  $value  ******",
    ).bgGreen().black().reverse().bold().italic().initial;
    _out(msg);
  }

  static void logSuccess(dynamic value) {
    if (!_enabled) return;
    final msg = Colorize(
      "--------   Success with : $value   --------",
    ).green().reverse().bold().italic().initial;
    _out(msg);
  }

  static void logFailed(dynamic value, dynamic reason) {
    if (!_enabled) return;
    final msg = Colorize(
      "++++++++   Failed with : $value  ||| Reason: $reason ++++++++",
    ).bgRed().white().bold().italic().initial;
    _out(msg);
  }

  static void logList(List items, {String listName = 'Default'}) {
    if (!_enabled) return;
    logLine('List "$listName" size=${items.length}');
    for (var i = 0; i < items.length; i++) {
      final msg = Colorize(
        "******  Item[$i] ===> ${items[i]}  ******",
      ).bgLightGray().black().bold().italic().initial;
      _out(msg);
    }
  }

  static void logLineWithTag({required dynamic tag, required dynamic message}) {
    if (!_enabled) return;
    final p1 = Colorize("******  [$tag]:").bgWhite().black().bold().initial;
    final p2 = Colorize(" $message  ******").bgBlue().black().bold().initial;
    _out(p1 + p2);
  }

  static void logLineWithTagError({
    required dynamic tag,
    required dynamic message,
    required dynamic error,
  }) {
    if (!_enabled) return;
    final p1 = Colorize("******  $tag: ").bgYellow().black().bold().initial;
    final p2 = Colorize(
      "$message >>>>> Error => $error  ******",
    ).bgLightRed().black().bold().initial;
    _out(p1 + p2);
  }

  static void logDivider({String symbol = '*', int length = 20}) {
    if (!_enabled) return;
    final msg = Colorize(
      List.filled(length, symbol).join(),
    ).bgDarkGray().yellow().bold().initial;
    _out(msg);
  }

  static void logWithLine({required dynamic title}) {
    if (!_enabled) return;
    final p1 = Colorize("*" * 25).bgYellow().black().bold().initial;
    final p2 = Colorize("$title").bgBlack().white().bold().initial;
    final p3 = Colorize("*" * 25).bgYellow().black().bold().initial;
    _out(p1 + p2 + p3);
  }

  static void logMap(Map<dynamic, dynamic> map) {
    if (!_enabled) return;
    logLine('Map entries=${map.length}');
    map.forEach((k, v) {
      final p1 = Colorize("Key: $k").bgBlue().white().bold().initial;
      final p2 = Colorize(" => Value: $v").bgYellow().black().bold().initial;
      _out(p1 + p2);
    });
  }

  static void logMapWithTag({
    String? tag,
    String? message,
    required Map<dynamic, dynamic> map,
  }) {
    if (!_enabled) return;
    logLine('Map entries=${map.length}');
    map.forEach((k, v) {
      final p1 = Colorize(
        "******  ${tag ?? 'TAG'}: ",
      ).bgYellow().black().bold().initial;
      final p2 = message != null
          ? Colorize(" $message  ******").bgBlue().black().bold().initial
          : '';
      final p3 = Colorize("Key: $k").bgBlue().white().bold().initial;
      final p4 = Colorize(" => Value: $v").black().bgCyan().bold().initial;
      _out(p1 + p2 + p3 + p4);
    });
  }

  static void logErrorWithStackTrace(dynamic value, StackTrace stackTrace) {
    if (!_enabled) return;
    final e = Colorize(
      "The Error is : ******  $value  ******",
    ).bgRed().black().bold().italic().initial;
    final st = Colorize(
      "Stack Trace:\n$stackTrace",
    ).bgBlue().white().italic().bold().initial;
    _out(e);
    _out(st);
  }
}
