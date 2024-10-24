import 'package:flutter/foundation.dart';

class CustomPrint{
 static void printResponse(String text) {
  if (kDebugMode) {
    printFullText('\x1B[33m$text\x1B[0m');
  }
}

static void printError(String text) {
  if (kDebugMode) {
    printFullText('\x1B[31m$text\x1B[0m');
  }
}

static void printTest(String text) {
  if (kDebugMode) {
    printFullText('\x1B[32m$text\x1B[0m');
  }
}

static void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
}

}