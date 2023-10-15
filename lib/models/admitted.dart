class AdmittedModel{


  String? n_official_family;
  String? n_families_in_child_delinquency;
  String? n_of_beds_in_internal_delinquency;
  String? n_of_beds_in_delinquency_of_women;
  String? n_of_placements;
  String? family_occupancy_rate;
  String? av_period_of_hypnosis;
  String? av_hypnotists_per_day;
  String? av_of_sleepers_per_day;
  String? bed_turnover_rate;
  String? Bed_rest_period_between_patients;
  String? hospital_death_rate;



  AdmittedModel({
    this.n_official_family,
    this.n_families_in_child_delinquency,
    this.n_of_beds_in_internal_delinquency,
    this.n_of_beds_in_delinquency_of_women,
    this.n_of_placements,
    this.family_occupancy_rate,
    this.av_period_of_hypnosis,
    this.av_hypnotists_per_day,
    this.av_of_sleepers_per_day,
    this.bed_turnover_rate,
    this.Bed_rest_period_between_patients,
    this.hospital_death_rate,
  });
  AdmittedModel.fromjson(Map<String,dynamic>json){
    n_official_family=json['n_official_family'];
    n_families_in_child_delinquency=json['n_families_in_child_delinquency'];
    n_of_beds_in_internal_delinquency=json['n_of_beds_in_internal_delinquency'];
    n_of_beds_in_delinquency_of_women=json['n_of_beds_in_delinquency_of_women'];
    n_of_placements=json['n_of_placements'];
    family_occupancy_rate=json['family_occupancy_rate'];
    av_period_of_hypnosis=json['av_period_of_hypnosis'];
    av_hypnotists_per_day=json['av_hypnotists_per_day'];
    av_of_sleepers_per_day=json['av_of_sleepers_per_day'];
    bed_turnover_rate=json['bed_turnover_rate'];
    Bed_rest_period_between_patients=json['Bed_rest_period_between_patients'];
    hospital_death_rate=json['hospital_death_rate'];
  }
  Map<String,dynamic>Tomap(){
    return{

      'n_official_family':n_official_family,
      'n_families_in_child_delinquency':n_families_in_child_delinquency,
      'n_of_beds_in_internal_delinquency':n_of_beds_in_internal_delinquency,
      'n_of_beds_in_delinquency_of_women':n_of_beds_in_delinquency_of_women,
      'n_of_placements':n_of_placements,
      'family_occupancy_rate':family_occupancy_rate,
      'av_period_of_hypnosis':av_period_of_hypnosis,
      'av_hypnotists_per_day':av_hypnotists_per_day,
      'av_of_sleepers_per_day':av_of_sleepers_per_day,
      'bed_turnover_rate':bed_turnover_rate,
      'Bed_rest_period_between_patients':Bed_rest_period_between_patients,
      'hospital_death_rate':hospital_death_rate,

    };
  }
}