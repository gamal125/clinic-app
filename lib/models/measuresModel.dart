class MeasuresModel{


  String? n_of_residents_served_by_hospital;
  String? n_of_residents_served_by_health_complex;
  String? n_of_ambulances;
  String? population_per_hospital_bed;
  String? distance_to_reference_hospital;
  String? time_to_reference_hospital;

  MeasuresModel({
    this.n_of_residents_served_by_hospital,
    this.n_of_residents_served_by_health_complex,
    this.n_of_ambulances,
    this.population_per_hospital_bed,
    this.distance_to_reference_hospital,
    this.time_to_reference_hospital,

  });


  MeasuresModel.fromjson(Map<String,dynamic>json){

    n_of_residents_served_by_hospital=json['n_of_residents_served_by_hospital'];
    n_of_residents_served_by_health_complex=json['n_of_residents_served_by_health_complex'];
    n_of_ambulances=json['n_of_ambulances'];
    population_per_hospital_bed=json['population_per_hospital_bed'];
    distance_to_reference_hospital=json['distance_to_reference_hospital'];
    time_to_reference_hospital=json['time_to_reference_hospital'];

  }
  Map<String,dynamic>Tomap(){
    return{

      'n_of_residents_served_by_hospital':n_of_residents_served_by_hospital,
      'n_of_residents_served_by_health_complex':n_of_residents_served_by_health_complex,
      'n_of_ambulances':n_of_ambulances,
      'population_per_hospital_bed':population_per_hospital_bed,
      'distance_to_reference_hospital':distance_to_reference_hospital,
      'time_to_reference_hospital':time_to_reference_hospital,

    };
  }
}