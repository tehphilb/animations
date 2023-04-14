import 'package:flutter/material.dart';

import 'pages/animated_background.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            createCard(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AniBackground(),
                      ),
                    ),
                color: Colors.teal[100],
                text: const Text("He'd have you all unravel at the")),
          ],
        ),
      ),
    );
  }
}

Widget createCard({
  Color? color,
  required Text text,
  required VoidCallback onPressed,
}) =>
    Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text,
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: onPressed,
              child: const Text(
                "go to page",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
      ),
    );
