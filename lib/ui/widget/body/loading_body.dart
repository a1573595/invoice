import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade100,
      child: IgnorePointer(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
