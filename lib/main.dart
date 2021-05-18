import 'package:flutter/material.dart';
import 'package:flutter_sanctum/widgets/app_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rui Calei'),
        ),
        drawer: AppDrawer(),
        body: Center(
          child: Text('You are not logged in'),
        ),

      ),
    );
  }
}
