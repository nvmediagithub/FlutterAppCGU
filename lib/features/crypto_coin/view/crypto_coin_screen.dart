import 'package:flutter/material.dart';

class MyAppSecondScreen extends StatefulWidget {
  const MyAppSecondScreen({super.key});

  @override
  State<MyAppSecondScreen> createState() => _MyAppSecondScreenState();
}

class _MyAppSecondScreenState extends State<MyAppSecondScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    coinName = args as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(coinName ?? '...'),
      ),
    );
  }
}
