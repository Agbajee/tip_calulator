// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tip'),
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
  int primaryColor = 0xFF2962FF;
  int secondaryColor = 0xFF4A148C;

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billPayment = 0.0;

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor:Colors.white,
        leading: IconButton(
            onPressed: () => _getMessage(context),
            icon: Icon(
                Icons.arrow_back_ios,
                color: Color(secondaryColor),
            )
        ),
      ),
      backgroundColor:Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
  SnackBar _getMessage(context) {
    final snackBar = SnackBar(
      backgroundColor: Color(primaryColor),
      content: Text('button is working'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }
}
