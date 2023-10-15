class NoteModel{


  String? note;


  NoteModel({
    this.note,

  });


  NoteModel.fromjson(Map<String,dynamic>json){

    note=json['note'];


  }
  Map<String,dynamic>Tomap(){
    return{

      'note':note,

    };
  }
}