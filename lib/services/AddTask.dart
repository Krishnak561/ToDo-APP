import 'package:flutter/material.dart';
import 'MyWidgets.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoTask {
  List<Widget> _myTaskList = [];

  void addTask(BuildContext context, String Task) {
    _myTaskList.add(MyTodoTask(context, Task));
  }

  Expanded MyTodoList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _myTaskList.length,
        itemBuilder: (context, index) {
          return _myTaskList[index];
        },
      ),
    );
  }
}

class myList extends StatefulWidget {
  @override
  _myListState createState() => _myListState();
}

class _myListState extends State<myList> {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<QuerySnapshot>(context);
    print(tasks);
    return Container();
  }
}
