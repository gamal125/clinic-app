class WorkForceModel{


  String? n_doctors;
  String? n_specialists;
  String? n_Dentists;
  String? n_nurses;
  String? n_of_Dental_technician;
  String? n_Laboratory_technician;
  String? n_Pharmacists;
  String? n_helper_Pharmacists;
  String? n_of_Nutrition_technician;
  String? n_health_education;
  String? n_dressers;
  String? medical_records;
  String? other_technical_categories;
  String? other_administrative_categories;

  WorkForceModel({
    this.n_doctors,
    this.n_specialists,
    this.n_Dentists,
    this.n_nurses,
    this.n_of_Dental_technician,
    this.n_Laboratory_technician,
    this.n_Pharmacists,
    this.n_helper_Pharmacists,
    this.n_of_Nutrition_technician,
    this.n_health_education,
    this.n_dressers,
    this.medical_records,
    this.other_technical_categories,
    this.other_administrative_categories,
  });


  WorkForceModel.fromjson(Map<String,dynamic>json){

    n_doctors=json['n_doctors'];
    n_specialists=json['n_specialists'];
    n_Dentists=json['n_Dentists'];
    n_nurses=json['n_nurses'];
    n_of_Dental_technician=json['n_of_Dental_technician'];
    n_Laboratory_technician=json['n_Laboratory_technician'];
    n_Pharmacists=json['n_Pharmacists'];
    n_helper_Pharmacists=json['n_helper_Pharmacists'];
    n_of_Nutrition_technician=json['n_of_Nutrition_technician'];
    n_health_education=json['n_health_education'];
    n_dressers=json['n_dressers'];
    medical_records=json['medical_records'];
    other_technical_categories=json['other_technical_categories'];
    other_administrative_categories=json['other_administrative_categories'];

  }
  Map<String,dynamic>Tomap(){
    return{
      'n_doctors':n_doctors,
      'n_specialists':n_specialists,
      'n_Dentists':n_Dentists,
      'n_nurses':n_nurses,
      'n_of_Dental_technician':n_of_Dental_technician,
      'n_Laboratory_technician':n_Laboratory_technician,
      'n_Pharmacists':n_Pharmacists,
      'n_helper_Pharmacists':n_helper_Pharmacists,
      'n_of_Nutrition_technician':n_of_Nutrition_technician,
      'n_health_education':n_health_education,
      'n_dressers':n_dressers,
      'medical_records':medical_records,
      'other_technical_categories':other_technical_categories,
      'other_administrative_categories':other_administrative_categories,
    };
  }
}