import 'package:flutter/material.dart';

class CoverMessage extends StatelessWidget {
  const CoverMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Placeholder(
          fallbackHeight: 50,
          fallbackWidth: 50,
        ),
      ),
    );
  }
}
