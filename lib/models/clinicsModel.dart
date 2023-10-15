class ClinicModel{


  String? n_reviewers;
  String? av_working;
  String? av_holiday;
  String? per_child_visit;
  String? per_adults_visit;
  String? n_dental_visits;
  String? av_visits_per_day;

  ClinicModel({
    this.n_reviewers,
    this.av_working,
    this.av_holiday,
    this.per_child_visit,
    this.per_adults_visit,
    this.n_dental_visits,
    this.av_visits_per_day,

  });


  ClinicModel.fromjson(Map<String,dynamic>json){

    n_reviewers=json['n_reviewers'];
    av_working=json['av_working'];
    av_holiday=json['av_holiday'];
    per_child_visit=json['per_child_visit'];
    per_adults_visit=json['per_adults_visit'];
    n_dental_visits=json['n_dental_visits'];
    av_visits_per_day=json['av_visits_per_day'];

  }
  Map<String,dynamic>Tomap(){
    return{

      'n_reviewers':n_reviewers,
      'av_working':av_working,
      'av_holiday':av_holiday,
      'per_child_visit':per_child_visit,
      'per_adults_visit':per_adults_visit,
      'n_dental_visits':n_dental_visits,
      'av_visits_per_day':av_visits_per_day,

    };
  }
}