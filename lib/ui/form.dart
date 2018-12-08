import 'package:flutter/material.dart';
//import 'dart:async';

class FormAddTask extends StatefulWidget {
  @override
  _FormAddTaskState createState() => _FormAddTaskState();
}

class _FormAddTaskState extends State<FormAddTask> {
  TextEditingController _inputTaskController = new TextEditingController();
  TextEditingController _inputDueDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new  AppBar(
        title: new Text('add task'),
        backgroundColor: Colors.amberAccent,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _inputTaskController,
              decoration: new InputDecoration(
                labelText: 'Task Name',
                hintText: 'Descrobe Task not to do',
              ),
            ),
            new TextField(
              controller: _inputDueDateController,
              decoration: new InputDecoration(
                labelText: 'Due Date',
                hintText: 'Until When you should not do that',
              ),
            ),
            new RaisedButton(
              child: new Text('Submit'),
              onPressed: () => Navigator.pop(context, {
                'taskname' : _inputTaskController.text,
                'duedate': _inputDueDateController.text,
              }),
            ),
          ],
        ),
      ),
      
    );
  }
}