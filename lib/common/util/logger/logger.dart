import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

final class Logger {
  Logger._();

  static final Logger instance = Logger._();

  final Talker _talker = Talker(
    filter: BaseTalkerFilter(
      titles: [],
      types: [],
    ),
    settings: TalkerSettings(
      enabled: true,
      useConsoleLogs: true,
      useHistory: true,
      maxHistoryItems: 1000,
    ),
  );

  Widget get screen => TalkerScreen(talker: _talker);

  void log(TalkerLog log) => _talker.logCustom(log);
}
