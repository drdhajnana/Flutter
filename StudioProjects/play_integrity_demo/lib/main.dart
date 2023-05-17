import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp()
      .then((value) async => await FirebaseAppCheck.instance.activate(
            androidProvider: kReleaseMode
                ? AndroidProvider.playIntegrity
                : AndroidProvider.debug,
            webRecaptchaSiteKey:
                kReleaseMode ? "Enter your key here." : 'recaptcha-v3-site-key',
          ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  DatabaseReference refReal = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            //
            // ElevatedButton stores the last value showing on the screen in firestore database and resets the counter.
            //
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('Count')
                    .doc("LastCount")
                    .update({'LC': _counter.toString()}).whenComplete(() {
                  _counter;
                }).whenComplete(() {
                  _counter = 0;
                  setState(() {
                    _counter;
                  });
                });
              },
              child: const Text(
                'Reset',
              ),
            )
          ],
        ),
      ),
      //
      // floatingActionButton stores the value showing on the screen in realtime database.
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _counter++;
          if ('$_counter' == "1") {
            await refReal
                .child("Number")
                .set(_counter.toString())
                .whenComplete(() => setState(() {
                      _counter;
                    }));
          } else {
            await refReal.update({"Number": "$_counter"}).whenComplete(
                () => setState(() {
                      _counter;
                    }));
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
