import 'package:api_parsing_serialize/src/model/ContactModel.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void apiCall() async {
    var x = await dioCall();
    print(x);
  }

  Future<int> dioCall() async {


    try {
      Response response = await Dio().get("https://api.androidhive.info/contacts/");
      print(response);
      final contactModel = contactModelFromJson(response.toString());

      print("Api Call :: > ${contactModel.toJson()['contacts']}");


//      List<Contact> listContact = contactModel.toJson()['contacts'];

//      List<Contact> listContact1 = listContact.asMap().values;



      var list = contactModel.toJson()['contacts'] as List;
      print(list.runtimeType); //returns List<dynamic>
      List<Contact> contactList = list.map((i) => Contact.fromJson(i)).toList();

      print("Api Callx :: > ${contactList[2].phone.toJson()}");


      var list2 = contactList[0].email;
      Phone list1 = contactList[0].phone;
//      fromJson()['phone'];
      print("Api phone x :: > ${list1.mobile}"); //returns List<dynamic>
      print("Api phone list2 x :: > ${list2}"); //returns List<dynamic>
//      List<Contact> contactList = list.map((i) => Contact.fromJson(i)).toList();




      /* List<Contact> list = List<Contact>.from(contactModel.toJson()['contacts'].map((i) {
         return Contact.fromJson(i);
       }));*/

      print("Api Callx :: > ${list1.toJson()["phone"]}");

//      List<Phone> list2 = list.from(parsed.map((i) => Phone.fromJson(i)));
//
//      var listt = List<Phone>.from(list[2].phone.map((i) => Phone.fromJson(i)));
////      var listt = list[2].phone.toJson();
//
//      print("Api Callx :: > ${listt[0].mobile}");


//      List<Contact> likes;
//
//
//
//      var sdsd = ContactModel.fromJson(Map<String, dynamic> json) {
//        likes = contactModel.toJson()['contacts'].cast<Contact>();
//      };



    } catch (e) {
      print(e);
    }

    return 4;
  }


  @override
  void initState() {
    apiCall();
    super.initState();
  }

//  @override
//  void initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
