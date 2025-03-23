import 'package:logger/logger.dart' as logger;

// logger
class Logger {
  final _log = logger.Logger(
    printer: logger.PrettyPrinter(), // PrettyPrinter(errorMethodCount: 10),
  );

  //  PrettyPrinter({
  //   this.stackTraceBeginIndex = 0,
  //   this.methodCount = 2,
  //   this.errorMethodCount = 8,
  //   this.lineLength = 120,
  //   this.colors = true,
  //   this.printEmojis = true,
  //   this.printTime = false,
  //   this.excludeBox = const {},
  //   this.noBoxingByDefault = false,
  //   this.excludePaths = const [],
  // })

  final _loggerNoStack = logger.Logger(
    printer: logger.PrettyPrinter(methodCount: 0),
  );

  void demo() {
    _log.d('Log message with 2 methods');

    _loggerNoStack.i('Info message');

    _loggerNoStack.w('Just a warning!');

    _log.e('Error! Something bad happened', 'Test Error');

    _loggerNoStack.v({'key': 5, 'value': 'something'});

    logger.Logger(printer: logger.SimplePrinter(colors: true)).v('boom');
  }
}


// I/flutter ( 8831): ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): │ #0   Logger.demo (package:fast_app_base/common/log/logger.dart:14:10)
// I/flutter ( 8831): │ #1   HomeFragment.build.<anonymous closure> (package:fast_app_base/screen/main/tab/home/f_home.dart:61:42)
// I/flutter ( 8831): ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
// I/flutter ( 8831): │ 🐛 Log message with 2 methods
// I/flutter ( 8831): └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): │ 💡 Info message
// I/flutter ( 8831): └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): │ ! Just a warning!
// I/flutter ( 8831): └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

// I/flutter ( 8831): ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): │ Test Error
// I/flutter ( 8831): ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
// I/flutter ( 8831): │ #0   Logger.demo (package:fast_app_base/common/log/logger.dart:20:10)
// I/flutter ( 8831): │ #1   HomeFragment.build.<anonymous closure> (package:fast_app_base/screen/main/tab/home/f_home.dart:61:42)
// I/flutter ( 8831): ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
// I/flutter ( 8831): │ ⛔ Error! Something bad happened
// I/flutter ( 8831): └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): │ {
// I/flutter ( 8831): │   "key": 5,
// I/flutter ( 8831): │   "value": "something"
// I/flutter ( 8831): │ }
// I/flutter ( 8831): └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
// I/flutter ( 8831): [V]  boom