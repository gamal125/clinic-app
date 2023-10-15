
import 'package:clinics/models/admitted.dart';
import 'package:clinics/models/analysisModel.dart';
import 'package:clinics/models/clinicsModel.dart';
import 'package:clinics/models/deathsModel.dart';
import 'package:clinics/models/labModel.dart';
import 'package:clinics/models/measuresModel.dart';
import 'package:clinics/models/motherCareModel.dart';
import 'package:clinics/models/noteModel.dart';
import 'package:clinics/screen/MothersCare.dart';
import 'package:clinics/screen/Outpatient%20clinics.dart';
import 'package:clinics/screen/care.dart';
import 'package:clinics/screen/deaths.dart';
import 'package:clinics/screen/laboratory_services.dart';
import 'package:clinics/screen/indicators.dart';
import 'package:clinics/screen/workforce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:math';


import '../models/workForceModel.dart';
import 'MainStates.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(NewsInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.local_hospital,
        ),
        label: 'عيادات خارجيه'),
    BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage('assets/icons/Lab.png')
        ),
        label: 'المختبر'),
    BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage('assets/icons/mother.png')
        ),
        label: 'رعاية الامومه'),
    BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage('assets/icons/bed.png')
        ),
        label: 'التنويم'),
    BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage('assets/icons/death.png')
        ),
        label: 'الوفيات'),
    BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage('assets/icons/measure.png')
        ),
        label: 'مؤشرات '),
    BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage('assets/icons/workforce.png')
        ),
        label: 'القوي العامله '),

  ];
  int randomNumber = Random().nextInt(100);
  List<Widget> screens = [
    OutpatientClinic(),
    LaboratoryServices(),
    MothersCare(),
    Care(),
    Deaths(),
    Indicators(),
    Workforce()
  ];
  List<String> titles = [
    "عيادات خارجيه",
   "المختبر و الاشعة",
    "رعاية الامومه",
    "التنويم ",
    " الوفيات",
    " مؤشرات سكانية",
    " القوى العامله",
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getLabModeldata(DateFormat('yyyy').format(DateTime.now()));
    if (index == 2) getMotherModeldata(DateFormat('yyyy').format(DateTime.now()));
    if (index == 3)  getAdmittedModeldata(DateFormat('yyyy').format(DateTime.now()));
    if (index == 4) getDeathModeldata(DateFormat('yyyy').format(DateTime.now()));
    if (index == 5) getMeasuresModeldata(DateFormat('yyyy').format(DateTime.now()));
    if (index == 6) getWorkForceModeldata(DateFormat('yyyy').format(DateTime.now()));

    emit(NewsBottomNavState());
  }

   ClinicModel clinicmodel=ClinicModel();
  MotherCareModel mothersCare=MotherCareModel();
  LabModel labModel=LabModel();
  AdmittedModel admittedModel=AdmittedModel();
  DeathsModel deathsModel=DeathsModel();
  MeasuresModel measuresModel=MeasuresModel();
  WorkForceModel workForceModel=WorkForceModel();
  List<NoteModel> noteModel=[];
  List<AnalysisModel> analysisModel=[];
  void setNoteModeldata({
    required String note,


  }){
    emit(SetNoteModeldataLoadingState());
    NoteModel model=NoteModel(
        note:note




    );
    FirebaseFirestore.instance.collection('notes').doc(note).set(model.Tomap()).then(
            (value) {
          emit(SetNoteModeldataSuccesState());
        });

  }
  void getNoteModeldata(){
    FirebaseFirestore.instance.collection('notes').get().then((value) {
      value.docs.forEach((element) {
        noteModel.add(NoteModel.fromjson(element.data()));

      });



      emit(GetNoteModeldataSuccesState());
    });
  }
  void deleteNoteModeldata(note){
    emit(DeleteNoteModeldataLoadingState());

    FirebaseFirestore.instance.collection('notes').doc(note).delete().then((value) {});
    noteModel.clear();
    getNoteModeldata();
    emit(DeleteNoteModeldataSuccesState());
  }
  void setAnalysisModeldata({
    required String analysis,


  }){
    emit(SetAnalysisModeldataLoadingState());
    AnalysisModel model=AnalysisModel(
        analy:analysis




    );
    FirebaseFirestore.instance.collection('analysis').doc(analysis).set(model.Tomap()).then(
            (value) {
          print('done');
          emit(SetAnalysisModeldataSuccesState());
        });

  }
  void getAnalysisModeldata(){
    FirebaseFirestore.instance.collection('analysis').get().then((value) {
      value.docs.forEach((element) {
        analysisModel.add(AnalysisModel.fromjson(element.data()));

      });



      emit(GetAnalysisModeldataSuccesState());
    });
  }
  void deleteAnalysisModeldata(note){
    emit(DeleteAnalysisModeldataLoadingState());

    FirebaseFirestore.instance.collection('analysis').doc(note).delete().then((value) {});
    analysisModel.clear();
    getAnalysisModeldata();
    emit(DeleteAnalysisModeldataSuccesState());
  }


  void setWorkForceModeldata({
    required String year,
    required String departName,
    required String n_doctors,
    required String n_specialists,
    required String n_Dentists,
    required String n_nurses,
    required String n_of_Dental_technician,
    required String n_Laboratory_technician,
    required String n_Pharmacists,
    required String n_helper_Pharmacists,
    required String n_of_Nutrition_technician,
    required String n_health_education,
    required String n_dressers,
    required String medical_records,
    required String other_technical_categories,
    required String other_administrative_categories,

  }){
    emit(SetworkforceModeldataLoadingState());
    workForceModel=WorkForceModel(

      n_doctors:n_doctors,
      n_specialists:n_specialists,
      n_Dentists:n_Dentists,
      n_nurses:n_nurses,
      n_of_Dental_technician:n_of_Dental_technician,
      n_Laboratory_technician:n_Laboratory_technician,
      n_Pharmacists:n_Pharmacists,
      n_helper_Pharmacists:n_helper_Pharmacists,
      n_of_Nutrition_technician:n_of_Nutrition_technician,
      n_health_education:n_health_education,
      n_dressers:n_dressers,
      medical_records:medical_records,
      other_technical_categories:other_technical_categories,
      other_administrative_categories:other_administrative_categories,



    );
    FirebaseFirestore.instance.collection('$year').doc('$departName').collection('$departName').doc('$departName').set(workForceModel.Tomap()).then(
            (value) {
          emit(SetworkforceModeldataSuccesState());
        });

  }
  void getWorkForceModeldata(year){
    FirebaseFirestore.instance.collection(year).doc('WorkForce').collection('WorkForce').doc('WorkForce').get().then((value) {
      workForceModel=WorkForceModel.fromjson(value.data()!);


      emit(GetworkforceModeldataSuccesState());
    });
  }



  void setMeasuresModeldata({
    required String year,
    required String departName,
    required String n_of_residents_served_by_hospital,
    required String n_of_residents_served_by_health_complex,
    required String n_of_ambulances,
    required String population_per_hospital_bed,
    required String distance_to_reference_hospital,
    required String time_to_reference_hospital,

  }){
    emit(SetMeasuresModeldataLoadingState());
    measuresModel=MeasuresModel(
      n_of_residents_served_by_hospital: n_of_residents_served_by_hospital,
      n_of_residents_served_by_health_complex: n_of_residents_served_by_health_complex,
      n_of_ambulances: n_of_ambulances,
      population_per_hospital_bed: population_per_hospital_bed,
      distance_to_reference_hospital:distance_to_reference_hospital,
      time_to_reference_hospital:time_to_reference_hospital,




    );
    FirebaseFirestore.instance.collection('$year').doc('$departName').collection('$departName').doc('$departName').set(measuresModel.Tomap()).then(
            (value) {
          emit(SetMeasuresModeldataSuccesState());
        });

  }
  void getMeasuresModeldata(year){
    FirebaseFirestore.instance.collection(year).doc('measures').collection('measures').doc('measures').get().then((value) {
      measuresModel=MeasuresModel.fromjson(value.data()!);


      emit(GetMeasuresModeldataSuccesState());
    });
  }

  void setDeathModeldata({
    required String year,
    required String departName,
    required String n_of_registered_deaths,
    required String cases_arrived_after_death_to_hospital,
    required String deaths_in_outpatient_clinics,
    required String cases_of_deaths_occurred_in_departments_of_hypnosis,

  }){
    emit(SetDeathModeldataLoadingState());
    deathsModel=DeathsModel(
        n_of_registered_deaths: n_of_registered_deaths,
        cases_arrived_after_death_to_hospital: cases_arrived_after_death_to_hospital,
        deaths_in_outpatient_clinics:deaths_in_outpatient_clinics,
        cases_of_deaths_occurred_in_departments_of_hypnosis:cases_of_deaths_occurred_in_departments_of_hypnosis,




    );
    FirebaseFirestore.instance.collection('$year').doc('$departName').collection('$departName').doc('$departName').set(deathsModel.Tomap()).then(
            (value) {
          emit(SetDeathModeldataSuccesState());
        });

  }
  void getDeathModeldata(year){
    FirebaseFirestore.instance.collection(year).doc('death').collection('death').doc('death').get().then((value) {
      deathsModel=DeathsModel.fromjson(value.data()!);


      emit(GetDeathModeldataSuccesState());
    });
  }



  void setAdmittedModeldata({


    required String year,
    required String departName,
    required String n_official_family,
    required String n_families_in_child_delinquency,
    required String n_of_beds_in_internal_delinquency,
    required String n_of_beds_in_delinquency_of_women,
    required String n_of_placements,
    required String family_occupancy_rate,
    required String av_period_of_hypnosis,
    required String av_hypnotists_per_day,
    required String av_of_sleepers_per_day,
    required String bed_turnover_rate,
    required String Bed_rest_period_between_patients,
    required String hospital_death_rate,
  }){
    emit(SetAdmittedModeldataLoadingState());
    admittedModel=AdmittedModel(

        n_official_family: n_official_family,
        n_families_in_child_delinquency:n_families_in_child_delinquency,
        n_of_beds_in_internal_delinquency:n_of_beds_in_internal_delinquency,
        n_of_beds_in_delinquency_of_women:n_of_beds_in_delinquency_of_women,
        n_of_placements:n_of_placements,
      family_occupancy_rate:family_occupancy_rate,
      av_period_of_hypnosis:av_period_of_hypnosis,
      av_hypnotists_per_day:av_hypnotists_per_day,
      av_of_sleepers_per_day:av_of_sleepers_per_day,
      bed_turnover_rate:bed_turnover_rate,
      Bed_rest_period_between_patients:Bed_rest_period_between_patients,
      hospital_death_rate:hospital_death_rate,


    );
    FirebaseFirestore.instance.collection('$year').doc('$departName').collection('$departName').doc('$departName').set(admittedModel.Tomap()).then(
            (value) {
          emit(SetAdmittedModeldataSuccesState());
        });

  }
  void getAdmittedModeldata(year){
    FirebaseFirestore.instance.collection(year).doc('admitted').collection('admitted').doc('admitted').get().then((value) {
      admittedModel=AdmittedModel.fromjson(value.data()!);


      emit(GetAdmittedModeldataSuccesState());
    });
  }

  void setLabModeldata({
    required String year,
    required String departName,
    required String n_lab_tests,
    required String av_day,
    required String av_lab_technician_per_day,
    required String per_petient_test,
    required String n_rays_test,
    required String daily_rate,
    required String av_rays_foreach_tech,
    required String av_rays_foreach_petiant,
  }){
    emit(SetLabModeldataLoadingState());
    labModel=LabModel(
        n_lab_tests: n_lab_tests,
        av_day: av_day,
        av_lab_technician_per_day:av_lab_technician_per_day,
        per_petient_test:per_petient_test,
        n_rays_test:n_rays_test,
        daily_rate:daily_rate,
        av_rays_foreach_tech:av_rays_foreach_tech,
        av_rays_foreach_petiant:av_rays_foreach_petiant



    );
    FirebaseFirestore.instance.collection('$year').doc('$departName').collection('$departName').doc('$departName').set(labModel.Tomap()).then(
            (value) {
          emit(SetLabModeldataSuccesState());
        });

  }
  void getLabModeldata(year){
    FirebaseFirestore.instance.collection(year).doc('lab').collection('lab').doc('lab').get().then((value) {
      labModel=LabModel.fromjson(value.data()!);


      emit(GetLabModeldataSuccesState());
    });
  }



  void getMotherModeldata(year){
    FirebaseFirestore.instance.collection(year).doc('mother').collection('mother').doc('mother').get().then((value) {
      mothersCare=MotherCareModel.fromjson(value.data()!);
      print(mothersCare.n_pregnent_visits);

      emit(GetMotherModeldataSuccesState());
    });
  }
  void getClinicModeldata(year){
    FirebaseFirestore.instance.collection(year).doc('clinics').collection('clinics').doc('clinics').get().then((value) {
      clinicmodel=ClinicModel.fromjson(value.data()!);
      print(clinicmodel.av_holiday);

      emit(GetClinicModeldataSuccesState());
    });
  }
  void setMotherModeldata({
    required String year,
    required String departName,
    required String? n_pregnent_visits,
    required String? n_mothers_visits_after_brith,
    required String? per_visits_in_first_trimester,
    required String? per_pregnancy_anemia,
    required String? per_pregnancy_diabetes,
    required String? per_pregnancy_stress,
    required String? n_brithing_in_hospital,
    required String? av_brithing_per_mounth,
    required String? per_low_birth_weight,
    required String? birth_spacing_visits,

  }){
    emit(SetMotherModeldataLoadingState());
    mothersCare=MotherCareModel(
    n_pregnent_visits:n_pregnent_visits,
      n_mothers_visits_after_brith:n_mothers_visits_after_brith,
    per_visits_in_first_trimester:per_visits_in_first_trimester,
     per_pregnancy_anemia:per_pregnancy_anemia,
       per_pregnancy_diabetes:per_pregnancy_diabetes,
       per_pregnancy_stress:per_pregnancy_stress,
     n_brithing_in_hospital:n_brithing_in_hospital,
       av_brithing_per_mounth:av_brithing_per_mounth,
       per_low_birth_weight:per_low_birth_weight,
      birth_spacing_visits:birth_spacing_visits,
    );
    FirebaseFirestore.instance.collection('$year').doc('$departName').collection('$departName').doc('$departName').set(mothersCare.Tomap()).then(
            (value) {
          emit(SetMotherModeldataSuccesState());
        });

  }

  void setClinicModeldata({
    required String year,
    required String departName,
    required String? n_reviewers,
    required String? av_working,
    required String? av_holiday,
    required String? per_child_visit,
    required String? per_adults_visit,
    required String? n_dental_visits,
    required String? av_visits_per_day,
}){
    emit(SetClinicModeldataLoadingState());
    clinicmodel=ClinicModel(
        n_reviewers: n_reviewers,
      av_working: av_working,
      av_holiday: av_holiday,
      per_child_visit: per_child_visit,
      per_adults_visit: per_adults_visit,
      n_dental_visits: n_dental_visits,
      av_visits_per_day: av_visits_per_day
    );
    FirebaseFirestore.instance.collection('$year').doc('$departName').collection('$departName').doc('$departName').set(clinicmodel.Tomap()).then(
            (value) {
emit(SetClinicModeldataSuccesState());
            });

  }






}
