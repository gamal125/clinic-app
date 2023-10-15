

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class editScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var n_reviewers=TextEditingController();
  var av_working=TextEditingController();
  var av_holiday=TextEditingController();
  var per_child_visit=TextEditingController();
  var per_adults_visit=TextEditingController();
  var n_dental_visits=TextEditingController();
  var av_visits_per_day=TextEditingController();

  editScreen({
    required this.year,
    });
  String year;
  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);
     n_reviewers.text=c.clinicmodel.n_reviewers!;
     av_working.text=c.clinicmodel.av_working!;
     av_holiday.text=c.clinicmodel.av_holiday!;
     per_child_visit.text=c.clinicmodel.per_child_visit!;
     per_adults_visit.text=c.clinicmodel.per_adults_visit!;
     n_dental_visits.text=c.clinicmodel.n_dental_visits!;
     av_visits_per_day.text=c.clinicmodel.av_visits_per_day!;

    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is SetClinicModeldataSuccesState){
          MainCubit.get(context).getClinicModeldata(year);



        }
        if(state is GetClinicModeldataSuccesState){
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
                              Text('إجمالي عدد المراجعين'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_reviewers,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_reviewers.text,
                                  hint:n_reviewers.text


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
                              Text('المتوسط الیومي ایام الدوام الرسمي '),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_working,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_working.text,
                                  hint:av_working.text


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

                              Text('المتوسط الیومي " ایام الاجازات'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_holiday,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_holiday.text,
                                  hint:av_holiday.text


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
                              Text('نسبة زیارات الاطفال'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: per_child_visit,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: per_child_visit.text,
                                  hint:per_child_visit.text


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
                              Text(' نسبة زیارات البالغین '),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: per_adults_visit,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: per_adults_visit.text,
                                  hint:per_adults_visit.text


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
                              Text(' عدد زیارات عیادة الاسنان'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_dental_visits,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_dental_visits.text,
                                  hint:n_dental_visits.text


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
                              Text('متوسط الزیارات الیومي'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_visits_per_day,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_visits_per_day.text,
                                  hint:av_visits_per_day.text


                              ),
                            ],
                          ),
                        ),
                      ),




                      const SizedBox(
                        height: 20,
                      ),


                      ConditionalBuilder(condition:state is! SetClinicModeldataLoadingState&&
                          state is!SetClinicModeldataSuccesState&&state is! GetClinicModeldataLoadingState,
                          builder: (context)=>Center(
                            child: defaultMaterialButton(

                              function: () {
                                c.setClinicModeldata(
                                    year: year,
                                    departName: 'clinics',
                                    n_reviewers: n_reviewers.text,
                                    av_working: av_working.text,
                                    av_holiday: av_holiday.text,
                                    per_child_visit: per_child_visit.text,
                                    per_adults_visit: per_adults_visit.text,
                                    n_dental_visits: n_dental_visits.text,
                                    av_visits_per_day: av_visits_per_day.text);

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
