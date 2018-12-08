import 'package:flutter/material.dart';
import 'form.dart';
import '../model/notodo_model.dart' as notoModel;
import '../masterdata/naming_internal.dart' as ni;


class Home extends StatefulWidget {
  final String title;
  List<notoModel.NoToDoModel> noToDo = new List<notoModel.NoToDoModel>();

  Home({Key key,this.title}) : super(key:key);
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    if(widget.noToDo.length==0)
    {
    notoModel.NoToDoModel _first = new notoModel.NoToDoModel('first task', 'due date');
    widget.noToDo.add(_first);
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${widget.title}'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Text('+',
        style: new TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),),
        onPressed: () => showAddTaskForm(context),
      ),
       body: ListView.builder(
         itemCount: (widget.noToDo.length != null)? widget.noToDo.length : 0,
         itemBuilder: (BuildContext context, int position){
           if(widget.noToDo.length != null){
           notoModel.NoToDoModel _tempTask = widget.noToDo[position];
           return new Card(
             color: Colors.white,
             child: ListTile(
               title: new Text(_tempTask.taskname,
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                  color: Colors.amber),
               ),
               subtitle: new Container(
                 child: Row(
                   children: <Widget>[
                     Padding(padding: EdgeInsets.fromLTRB(22.0, 0.0, 0.0, 0.0),),
                     new Text(_tempTask.duedate),
                   ],
                 ),
               ),
               trailing: new IconButton(
                 onPressed: () => deleteTask(position),
                icon: new Icon(Icons.add_a_photo,
                color: Colors.black,),
               ),
             ),
           );
           }
           

         },
       ),
      
        
      ); 
  }

void deleteTask(int position){
  
  setState(() {
      widget.noToDo.removeAt(position);
    });
}

void showAddTaskForm(BuildContext context) async{
  Map resulTask = await Navigator.of(context).push(
    MaterialPageRoute<Map>(builder: (BuildContext context)
    => new FormAddTask())
 ); // end push

  //do someting when task come back
    if(resulTask != null && resulTask.containsKey("taskname"))
    {
      print(resulTask["taskname"].toString());
      print(resulTask["duedate"].toString());
    notoModel.NoToDoModel _user =  notoModel.NoToDoModel.map(resulTask);
    print('print after cast: ${_user.taskname}');
    
    
    print("This is a " +resulTask["${ni.Database.taskName}"]);

    widget.noToDo.add(_user);

    }

}

}