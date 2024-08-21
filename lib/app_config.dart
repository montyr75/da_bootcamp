import 'package:flutter/foundation.dart';

import 'features/app/services/logger_service.dart';

// app info
const appName = "da_bootcamp";
const version = "0.0.1";
const debugMode = !kReleaseMode;

// create logger
final log = LoggerService(appName: appName, debugMode: debugMode);
