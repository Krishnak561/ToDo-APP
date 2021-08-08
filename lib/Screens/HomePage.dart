import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/services/AddTask.dart';
import 'package:todo/services/FireBase_Tasks.dart';
import 'package:todo/services/MyWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final myController = TextEditingController();
  TodoTask task = TodoTask();
  Database db = Database();
  String myTask;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: Database().tasks,
      child: Scaffold(
        backgroundColor: Color(0xFFEBEBEB),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFEBEBEB),
          title: Text(
            "TO DO App",
            style: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: TextField(
                          controller: myController,
                          decoration: InputDecoration(
                              hintText: 'Type Something here...',
                              border: InputBorder.none,
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // print(myController.text);
                      myTask = myController.text;
                      db.addItem(task: myTask);
                      setState(() {
                        task.addTask(context, myController.text);
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 25,
                      child: Icon(
                        Icons.add_rounded,
                        size: 35,
                        color: Color(0xFFEBEBEB),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            myList(),
          ],
        ),
      ),
    );
  }
}
