import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Email Assist',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _getMailAppBar(),
      drawer: _getMailAccountDrawerr(),
    );
  }

  AppBar _getMailAppBar() {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: new Text(
        'Your Emails',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 13.0),
          child: Icon(
            Icons.search,
            size: 25.0,
          ),
        ),
      ],
    );
  }

  Drawer _getMailAccountDrawerr() {
    Text email = new Text(
      "dharamrajbhatt97@gmail.com.com",
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
    );

    Text name = new Text(
      "Dharamraj Bhatt",
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
    );

    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.orangeAccent),
          accountName: name,
          accountEmail: email,
          currentAccountPicture: Icon(
            Icons.account_circle,
            size: 50.0,
            color: Colors.white,
          ),
        ),
      ],
    ));
  }
}
