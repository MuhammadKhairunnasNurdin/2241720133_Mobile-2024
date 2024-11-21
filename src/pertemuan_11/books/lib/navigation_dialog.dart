import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showColorDialog(context);
          },
          child: const Text('Change Color'),
        ),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    final newColor = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Lime'),
              onPressed: () {
                color = Colors.lime.shade700;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Purple'),
              onPressed: () {
                color = Colors.purple.shade700;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Amber'),
              onPressed: () {
                color = Colors.amber.shade700;
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );

    if (newColor != null) {
      setState(() {
        color = newColor;
      });
    }
  }
}
