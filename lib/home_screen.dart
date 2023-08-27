import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print('Init stat is running !');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies stat is running !');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose stat is running !');
    super.dispose();
  }


  String text = 'init text';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            TextButton(
              onPressed: () async {
                final response = await http.get(
                    Uri.parse('https://jsonplaceholder.typicode.com/users'));
                print('Response body: ${response.body}');

                setState(() {
                  text = response.body;
                });
              },
              child: Text(
                'Fetch Data',
                style: TextStyle(fontSize: 20.0),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
