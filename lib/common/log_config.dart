import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var log = Logger(
  printer: PrettyPrinter(
    noBoxingByDefault: false,
    colors: true,
    printTime: true,
    printEmojis: false,
    excludeBox: {},
  ),
);

var dlog = Logger(
  printer: PrettyPrinter(
    noBoxingByDefault: true,
    colors: true,
    printTime: false,
    printEmojis: true,
    stackTraceBeginIndex: 0,
    methodCount: 0,
    lineLength: 0,
    excludePaths: ['info', 'debug'],
  ),
);
