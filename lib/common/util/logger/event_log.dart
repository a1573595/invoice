import 'package:talker_flutter/talker_flutter.dart';

abstract class EventLog extends TalkerLog {
  @override
  String get title;

  EventLog.debug({
    required String message,
    Object? exception,
    StackTrace? stackTrace,
  }) : super(
          message,
          exception: exception,
          stackTrace: stackTrace ?? StackTrace.current,
          logLevel: LogLevel.debug,
        );

  EventLog.info({
    required String message,
    Object? exception,
    StackTrace? stackTrace,
  }) : super(
          message,
          exception: exception,
          stackTrace: stackTrace ?? StackTrace.current,
          logLevel: LogLevel.info,
        );

  EventLog.warning({
    required String message,
    Object? exception,
    StackTrace? stackTrace,
  }) : super(
          message,
          exception: exception,
          stackTrace: stackTrace ?? StackTrace.current,
          logLevel: LogLevel.warning,
        );

  EventLog.error({
    String? message,
    required Object exception,
    required StackTrace stackTrace,
  }) : super(
          message,
          exception: exception,
          stackTrace: stackTrace,
          logLevel: LogLevel.error,
        );
}
