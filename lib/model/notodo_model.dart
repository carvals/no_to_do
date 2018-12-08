class NoToDoModel{
String _taskname;
String _duedate;
int _id;

//constructor simple
NoToDoModel(this._taskname,this._duedate);

//getter
String get taskname => _taskname;
String get duedate => _duedate;
int get id => _id;

//constructor map
NoToDoModel.map(dynamic obj){
  this._taskname = obj['taskname'];
  this._duedate = obj['duedate'];
  this._id = obj['id'];
}

NoToDoModel.fromMap(Map<String, dynamic> map){
  this._taskname = map['taskname'];
  this._duedate = map['duedate'];
  this._id = map['id'];
}

//method to return map from user object
Map<String, dynamic>toMap(){
var map = new Map<String, dynamic>();
  map['taskname'] = _taskname;
  map['duedate'] = _duedate;

  if(_id!=null){
    map['id']=_id;
  }

return map;
}






}