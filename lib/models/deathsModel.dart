class DeathsModel{


  String? n_of_registered_deaths;
  String? cases_arrived_after_death_to_hospital;
  String? deaths_in_outpatient_clinics;
  String? cases_of_deaths_occurred_in_departments_of_hypnosis;

  DeathsModel({
    this.n_of_registered_deaths,
    this.cases_arrived_after_death_to_hospital,
    this.deaths_in_outpatient_clinics,
    this.cases_of_deaths_occurred_in_departments_of_hypnosis,
  });


  DeathsModel.fromjson(Map<String,dynamic>json){

    n_of_registered_deaths=json['n_of_registered_deaths'];
    cases_arrived_after_death_to_hospital=json['cases_arrived_after_death_to_hospital'];
    deaths_in_outpatient_clinics=json['deaths_in_outpatient_clinics'];
    cases_of_deaths_occurred_in_departments_of_hypnosis=json['cases_of_deaths_occurred_in_departments_of_hypnosis'];


  }
  Map<String,dynamic>Tomap(){
    return{

      'n_of_registered_deaths':n_of_registered_deaths,
      'cases_arrived_after_death_to_hospital':cases_arrived_after_death_to_hospital,
      'deaths_in_outpatient_clinics':deaths_in_outpatient_clinics,
      'cases_of_deaths_occurred_in_departments_of_hypnosis':cases_of_deaths_occurred_in_departments_of_hypnosis,


    };
  }
}