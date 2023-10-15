class MotherCareModel{


  String? n_pregnent_visits;
  String? n_mothers_visits_after_brith;
  String? per_visits_in_first_trimester;
  String? per_pregnancy_anemia;
  String? per_pregnancy_diabetes;

  String? per_pregnancy_stress;
  String? n_brithing_in_hospital;
  String? av_brithing_per_mounth;
  String? per_low_birth_weight;
  String? birth_spacing_visits;

  MotherCareModel({
    this.n_pregnent_visits,
    this.n_mothers_visits_after_brith,
    this.per_visits_in_first_trimester,
    this.per_pregnancy_anemia,
    this.per_pregnancy_diabetes,
    this.per_pregnancy_stress,
    this.n_brithing_in_hospital,
    this.av_brithing_per_mounth,
    this.per_low_birth_weight,
    this.birth_spacing_visits,




  });


  MotherCareModel.fromjson(Map<String,dynamic>json){

    n_pregnent_visits=json['n_pregnent_visits'];
    n_mothers_visits_after_brith=json['n_mothers_visits_after_brith'];
    per_visits_in_first_trimester=json['per_visits_in_first_trimester'];
    per_pregnancy_anemia=json['per_pregnancy_anemia'];
    per_pregnancy_diabetes=json['per_pregnancy_diabetes'];
    per_pregnancy_stress=json['per_pregnancy_stress'];
    n_brithing_in_hospital=json['n_brithing_in_hospital'];
    av_brithing_per_mounth=json['av_brithing_per_mounth'];
    per_low_birth_weight=json['per_low_birth_weight'];
    birth_spacing_visits=json['birth_spacing_visits'];

  }
  Map<String,dynamic>Tomap(){
    return{

      'n_pregnent_visits':n_pregnent_visits,
      'n_mothers_visits_after_brith':n_mothers_visits_after_brith,
      'per_visits_in_first_trimester':per_visits_in_first_trimester,
      'per_pregnancy_anemia':per_pregnancy_anemia,
      'per_pregnancy_diabetes':per_pregnancy_diabetes,
      'per_pregnancy_stress':per_pregnancy_stress,
      'n_brithing_in_hospital':n_brithing_in_hospital,
      'av_brithing_per_mounth':av_brithing_per_mounth,
      'per_low_birth_weight':per_low_birth_weight,
      'birth_spacing_visits':birth_spacing_visits,

    };
  }
}