

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class editScreen2 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();


  var n_pregnent_visits=TextEditingController();
  var n_mothers_visits_after_brith=TextEditingController();
  var per_visits_in_first_trimester=TextEditingController();
  var per_pregnancy_anemia=TextEditingController();
  var per_pregnancy_diabetes=TextEditingController();
  var per_pregnancy_stress=TextEditingController();
  var n_brithing_in_hospital=TextEditingController();
  var av_brithing_per_mounth=TextEditingController();
  var per_low_birth_weight=TextEditingController();
  var birth_spacing_visits=TextEditingController();



  editScreen2({
    required this.year,
    });
  String year;
  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);
     n_mothers_visits_after_brith.text=c.mothersCare.n_mothers_visits_after_brith!;
     per_visits_in_first_trimester.text=c.mothersCare.per_visits_in_first_trimester!;
     per_pregnancy_anemia.text=c.mothersCare.per_pregnancy_anemia!;
     per_pregnancy_diabetes.text=c.mothersCare.per_pregnancy_diabetes!;
     per_pregnancy_stress.text=c.mothersCare.per_pregnancy_stress!;
     n_brithing_in_hospital.text=c.mothersCare.n_brithing_in_hospital!;
     av_brithing_per_mounth.text=c.mothersCare.av_brithing_per_mounth!;
     birth_spacing_visits.text=c.mothersCare.birth_spacing_visits!;
     per_low_birth_weight.text=c.mothersCare.per_low_birth_weight!;
     n_pregnent_visits.text=c.mothersCare.n_pregnent_visits!;

    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is SetMotherModeldataSuccesState){
          MainCubit.get(context).getMotherModeldata(year);



        }
        if(state is GetMotherModeldataSuccesState){
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
                              Text('اجمالي زیارات الحوامل'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_pregnent_visits,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_pregnent_visits.text,
                                  hint:n_pregnent_visits.text


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
                              Text('عدد زیارات الامھات بعد الولادة'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_mothers_visits_after_brith,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_mothers_visits_after_brith.text,
                                  hint:n_mothers_visits_after_brith.text


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

                              Text('نسبة الزیارات في الثلث الأول من الحمل'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: per_visits_in_first_trimester,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: per_visits_in_first_trimester.text,
                                  hint:per_visits_in_first_trimester.text


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
                              Text('نسبة حالات انیمیا الحمل'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: per_pregnancy_anemia,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: per_pregnancy_anemia.text,
                                  hint:per_pregnancy_anemia.text


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
                              Text('نسبة حالات سكري الحمل '),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: per_pregnancy_diabetes,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: per_pregnancy_diabetes.text,
                                  hint:per_pregnancy_diabetes.text


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
                              Text('نسبة حالات ضغط الحمل '),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: per_pregnancy_stress,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: per_pregnancy_stress.text,
                                  hint:per_pregnancy_stress.text


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
                              Text('اجمالى حالات الولادات بالمستشفي'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_brithing_in_hospital,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_brithing_in_hospital.text,
                                  hint:n_brithing_in_hospital.text


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
                              Text(' متوسط عدد الولادات شھریا'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_brithing_per_mounth,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_brithing_per_mounth.text,
                                  hint:av_brithing_per_mounth.text


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
                              Text('نسبة ناقصي الوزن عند الولاده "من المولودین احیاء"'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: per_low_birth_weight,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: per_low_birth_weight.text,
                                  hint:per_low_birth_weight.text


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
                              Text('زیارات المباعده بین الولادات'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller:n_mothers_visits_after_brith ,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_mothers_visits_after_brith.text,
                                  hint:n_mothers_visits_after_brith.text


                              ),
                            ],
                          ),
                        ),
                      ),




                      const SizedBox(
                        height: 20,
                      ),


                      ConditionalBuilder(condition:state is! SetMotherModeldataLoadingState&&
                          state is!SetMotherModeldataSuccesState&&state is! GetMotherModeldataLoadingState,
                          builder: (context)=>Center(
                            child: defaultMaterialButton(

                              function: () {
                                c.setMotherModeldata(
                                    year: year,
                                    departName: 'mother',
                                    n_pregnent_visits: n_pregnent_visits.text,
                                    n_mothers_visits_after_brith: n_mothers_visits_after_brith.text,
                                    per_visits_in_first_trimester: per_visits_in_first_trimester.text,
                                    per_pregnancy_anemia: per_pregnancy_anemia.text,
                                    per_pregnancy_diabetes: per_pregnancy_diabetes.text,
                                    per_pregnancy_stress: per_pregnancy_stress.text,
                                    n_brithing_in_hospital: n_brithing_in_hospital.text,
                                    av_brithing_per_mounth: av_brithing_per_mounth.text,
                                    per_low_birth_weight: per_low_birth_weight.text,
                                    birth_spacing_visits: birth_spacing_visits.text);

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
