class LabModel{


  String? n_lab_tests;
  String? av_day;
  String? av_lab_technician_per_day;
  String? per_petient_test;
  String? n_rays_test;
  String? daily_rate;
  String? av_rays_foreach_tech;
  String? av_rays_foreach_petiant;


  LabModel({
    this.n_lab_tests,
    this.av_day,
    this.av_lab_technician_per_day,
    this.per_petient_test,
    this.n_rays_test,
    this.daily_rate,
    this.av_rays_foreach_tech,
    this.av_rays_foreach_petiant,

  });


  LabModel.fromjson(Map<String,dynamic>json){

    n_lab_tests=json['n_lab_tests'];
    av_day=json['av_day'];
    av_lab_technician_per_day=json['av_lab_technician_per_day'];
    per_petient_test=json['per_petient_test'];
    n_rays_test=json['n_rays_test'];
    daily_rate=json['daily_rate'];
    av_rays_foreach_tech=json['av_rays_foreach_tech'];
    av_rays_foreach_petiant=json['av_rays_foreach_petiant'];

  }
  Map<String,dynamic>Tomap(){
    return{

      'n_lab_tests':n_lab_tests,
      'av_day':av_day,
      'av_lab_technician_per_day':av_lab_technician_per_day,
      'per_petient_test':per_petient_test,
      'n_rays_test':n_rays_test,
      'daily_rate':daily_rate,
      'av_rays_foreach_tech':av_rays_foreach_tech,
      'av_rays_foreach_petiant':av_rays_foreach_petiant,

    };
  }
}