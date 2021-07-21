import 'package:flutter/material.dart';
import 'package:flutter_sanctum/pages/pages.dart';
import 'package:flutter_sanctum/providers/auth.dart';
import 'package:flutter_sanctum/widgets/app_drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Auth(), lazy: false,),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = FlutterSecureStorage();

  Future<void> _attemptAuthentication() async {
    final token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).attempt(token.toString());
  }
  @override
  void initState() {
    // TODO: implement initState
    _attemptAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: NavPage()
    );
  }
}
