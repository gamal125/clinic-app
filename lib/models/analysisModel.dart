class AnalysisModel{


  String? analy;


  AnalysisModel({
    this.analy,

  });


  AnalysisModel.fromjson(Map<String,dynamic>json){

    analy=json['analy'];


  }
  Map<String,dynamic>Tomap(){
    return{

      'analy':analy,

    };
  }
}