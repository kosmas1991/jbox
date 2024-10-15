import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String terminal;
  const DisplayScreen({super.key, this.terminal = ''});

  static final String routeName = '/display';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('terminal name: ${terminal}'),
      ),
    );
  }
}
