import 'package:flutter/material.dart';

class DefaultUi extends StatelessWidget {
  const DefaultUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Mohon menunggu!'),
      ),
    );
  }
}
