

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class editScreen3 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var n_official_family=TextEditingController();
  var n_families_in_child_delinquency=TextEditingController();
  var n_of_beds_in_internal_delinquency=TextEditingController();
  var n_of_beds_in_delinquency_of_women=TextEditingController();
  var n_of_placements=TextEditingController();
  var family_occupancy_rate=TextEditingController();
  var av_period_of_hypnosis=TextEditingController();
  var av_hypnotists_per_day=TextEditingController();
  var av_of_sleepers_per_day=TextEditingController();
  var bed_turnover_rate=TextEditingController();
  var Bed_rest_period_between_patients=TextEditingController();
  var hospital_death_rate=TextEditingController();

  editScreen3({
    required this.year,
    });
  String year;
  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);
     n_official_family.text=c.admittedModel.n_official_family!;
     n_families_in_child_delinquency.text= c.admittedModel.n_families_in_child_delinquency!;
     n_of_beds_in_internal_delinquency.text= c.admittedModel.n_of_beds_in_internal_delinquency!;
     n_of_beds_in_delinquency_of_women.text= c.admittedModel.n_of_beds_in_delinquency_of_women!;
     n_of_placements.text= c.admittedModel.n_of_placements!;
     family_occupancy_rate.text=c.admittedModel.family_occupancy_rate!;
     av_period_of_hypnosis.text= c.admittedModel.av_period_of_hypnosis!;
     av_hypnotists_per_day.text=c.admittedModel.av_hypnotists_per_day!;
     av_of_sleepers_per_day.text= c.admittedModel.av_of_sleepers_per_day!;
     bed_turnover_rate.text=c.admittedModel.bed_turnover_rate!;
     Bed_rest_period_between_patients.text=c.admittedModel.Bed_rest_period_between_patients!;
     hospital_death_rate.text= c.admittedModel.hospital_death_rate!;

    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is SetAdmittedModeldataSuccesState){
          MainCubit.get(context).getAdmittedModeldata(year);
        }
        if(state is GetAdmittedModeldataSuccesState){
          Navigator.pop(context);
        }

      },
      builder: (context, state) {

        return Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: Colors.white,
          ),
          body: Theme(
            data: myTheme,
            child: GestureDetector(
              onTap: (){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('عدد الاسرة الرسمي'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_official_family,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_official_family.text,
                                  hint:n_official_family.text


                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(' عدد الأسرة في جناح الاطفال '),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_families_in_child_delinquency,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_families_in_child_delinquency.text,
                                  hint:n_families_in_child_delinquency.text


                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(' عدد الأسرة في جناح الباطني'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_beds_in_internal_delinquency,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_beds_in_internal_delinquency.text,
                                  hint:n_of_beds_in_internal_delinquency.text


                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('عدد الأسرة في جناح نساء وولادة'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_beds_in_delinquency_of_women,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_beds_in_delinquency_of_women.text,
                                  hint:n_of_beds_in_delinquency_of_women.text


                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('العدد الكلي لحالات الترقید'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_placements,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_placements.text,
                                  hint:n_of_placements.text


                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('معدل اشغال الاسرة'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: family_occupancy_rate,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: family_occupancy_rate.text,
                                  hint:family_occupancy_rate.text


                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(' متوسط فترة التنویم"بالایام "'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_period_of_hypnosis,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_period_of_hypnosis.text,
                                  hint:av_period_of_hypnosis.text


                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('متوسط عددالمنومین یومیا'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_hypnotists_per_day,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_hypnotists_per_day.text,
                                  hint:av_hypnotists_per_day.text


                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('متوسط عدد المرقدین فى الیوم'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_of_sleepers_per_day,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_of_sleepers_per_day.text,
                                  hint:av_of_sleepers_per_day.text


                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(' معدل دوران السریر'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller:bed_turnover_rate ,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: bed_turnover_rate.text,
                                  hint:bed_turnover_rate.text


                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(' فترة خلو السریر بین المرضى')
                             ,
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: Bed_rest_period_between_patients,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: Bed_rest_period_between_patients.text,
                                  hint:Bed_rest_period_between_patients.text


                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(height: 120, width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('معدل الوفاة بالمستشفى'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller:hospital_death_rate ,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: hospital_death_rate.text,
                                  hint:hospital_death_rate.text


                              ),
                            ],
                          ),
                        ),
                      ),




                      const SizedBox(
                        height: 20,
                      ),


                      ConditionalBuilder(condition:state is! SetAdmittedModeldataLoadingState&&
                          state is!SetAdmittedModeldataSuccesState&&state is! GetAdmittedModeldataLoadingState,
                          builder: (context)=>Center(
                            child: defaultMaterialButton(

                              function: () {
                      c.setAdmittedModeldata(
                          year: year,
                          departName: "admitted",
                          n_official_family: n_official_family.text,
                          n_families_in_child_delinquency: n_families_in_child_delinquency.text,
                          n_of_beds_in_internal_delinquency: n_of_beds_in_internal_delinquency.text,
                          n_of_beds_in_delinquency_of_women: n_of_beds_in_delinquency_of_women.text,
                          n_of_placements: n_of_placements.text,
                          family_occupancy_rate: family_occupancy_rate.text,
                          av_period_of_hypnosis: av_period_of_hypnosis.text,
                          av_hypnotists_per_day: av_hypnotists_per_day.text,
                          av_of_sleepers_per_day: av_of_sleepers_per_day.text,
                          bed_turnover_rate: bed_turnover_rate.text,
                          Bed_rest_period_between_patients: Bed_rest_period_between_patients.text,
                          hospital_death_rate: hospital_death_rate.text);

                              },
                              text: 'حفظ',

                            ),
                          ),
                          fallback: (context)=>const Center(child: CircularProgressIndicator(),)),
                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
