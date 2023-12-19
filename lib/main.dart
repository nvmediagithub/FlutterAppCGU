import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        dividerTheme: const DividerThemeData(color: Colors.blue),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      home: const MyHomePage(title: 'IM ENE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) => ListTile(
            leading: SvgPicture.asset(
              'assets/svg/ruler.svg',
              height: 25,
              width: 25,
            ),
            title: Text(
              'Test',
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              '20pm',
              style: theme.textTheme.bodyMedium,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ),
      ),
    );
  }
}
