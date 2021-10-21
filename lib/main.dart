//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email Assist',
      //theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF42A5F5)),
      home: new Scaffold(
        //Here you can set what ever background color you need.
        backgroundColor: Colors.blue,

        body: Center(
          child: Container(
            height: 50,
            width: 220,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.blue),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () => signInWithGoogle(),
              icon: Icon(
                Icons.send_rounded,
              ),
              // icon: Image.asset('assets/images/icons/google.jpg'),
              //Icon(
              //icon: image.asset('assets/images/icons/google.jpg'),
              //Image.asset(google_image)

              label: Text(
                'Sign in with Google',
              ),
            ),
            // child: TextButton(
            //   onPressed: () => signInWithGoogle(),
            //   child: Text(
            //     "sign in with Google",
            //     style: TextStyle(color: Colors.red),
            //   ),
          ),
        ),
      ),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount googleuser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth = await googleuser.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  Fluttertoast.showToast(msg: "Account created");

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class MyApp1 extends StatelessWidget {
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
