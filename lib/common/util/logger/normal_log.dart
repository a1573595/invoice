import 'package:invoice/common/util/logger/event_log.dart';

class NormalLog extends EventLog {
  @override
  String get title => 'Normal';

  NormalLog.debug({
    required super.message,
    super.exception,
    StackTrace? stackTrace,
  }) : super.debug(stackTrace: stackTrace ?? StackTrace.current);

  NormalLog.info({
    required super.message,
    super.exception,
    StackTrace? stackTrace,
  }) : super.info(stackTrace: stackTrace ?? StackTrace.current);

  NormalLog.warning({
    required super.message,
    super.exception,
    StackTrace? stackTrace,
  }) : super.warning(stackTrace: stackTrace ?? StackTrace.current);

  NormalLog.error({
    super.message,
    required super.exception,
    required super.stackTrace,
  }) : super.error();
}
