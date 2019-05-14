import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<int> _history = [0];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Bottom Nav Back'),
      ),
      body: new Center(
        child: new Text('Page $_currentIndex'),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.touch_app),
            title: new Text('keypad'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.assessment),
            title: new Text('chart'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.cloud),
            title: new Text('weather'),
          ),
        ],
        onTap: (int index) {
          _history.add(index);
          setState(() => _currentIndex = index);
          Navigator.push(context, new BottomNavigationRoute()).then((x) {
            _history.removeLast();
            setState(() => _currentIndex = _history.last);
          });
        },
      ),
    );
  }
}

class BottomNavigationRoute extends Route<void> with LocalHistoryRoute {}