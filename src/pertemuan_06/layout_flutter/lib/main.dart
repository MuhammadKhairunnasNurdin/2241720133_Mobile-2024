import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            // question 1: Expanded and crossAxisAlignment.start
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // question 2:Padding 8 below and text
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Pura Giri Arjuno',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Tulungrejo, Kec. Bumiaji, Kota Batu, Jawa Timur, Indonesia',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // question 3: Red star icon and text '41'
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    // Step 1: Creating the buildButtonColumn method
    Column buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(color, Icons.call, 'CALL'),
        buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'It turns out that Batu also has a very magnificent place of worship for Hindus. The name of the place is Pura Giri Arjuno which is located in Dusun Junggo, Tulungrejo Village, Batu City.',
            softWrap: true,
          ),
          SizedBox(height: 16),
          Text(
            'This temple is now one of the tourist attractions in Batu that you should not miss. This temple is also the largest place of worship for Hindus in East Java.',
            softWrap: true,
          ),
          SizedBox(height: 16),
          Text(
            'This temple is located in a very strategic place because it has Mount Arjuno in the background, so the view offered is very beautiful and charming, besides the cool air and being surrounded by green apple and vegetable gardens will certainly give you an extraordinary impression.',
            softWrap: true,
          ),
          SizedBox(height: 16),
          Text(
            'Nama : Muhammad Khairunnas Nurdin'
          ),
          Text(
            'NIM : 2241720133',
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter Layout: Muhammad Khairunnas Nurdin / 2241720133',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wisata Batu'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'image/puragiriarjuno.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
