import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: IgnorePointer(
        child: Column(
          children: [
            Icon(Icons.error),
            const SizedBox(
              height: 16,
            ),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
