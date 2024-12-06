import 'package:flutter/material.dart';
import 'package:fw/ui/home.dart';
import 'package:fw/ui/product_homepage.dart'; // Make sure this import points to the correct Home page.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Latihan API Demo',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman HomePage saat tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductHomepage()), // Make sure ProductHomepage is defined
                );
              },
              child: Text('Ke Halaman Home'),
            ),
          ],
        ),
      ),
    );
  }
}
