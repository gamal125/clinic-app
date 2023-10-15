

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class editScreen4 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var n_of_registered_deaths=TextEditingController();
  var cases_arrived_after_death_to_hospital=TextEditingController();
  var deaths_in_outpatient_clinics=TextEditingController();
  var cases_of_deaths_occurred_in_departments_of_hypnosis=TextEditingController();


  editScreen4({
    required this.year,
    });
  String year;
  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);

     n_of_registered_deaths.text=c.deathsModel.n_of_registered_deaths!;
     cases_arrived_after_death_to_hospital.text=c.deathsModel.cases_arrived_after_death_to_hospital!;
     deaths_in_outpatient_clinics.text=c.deathsModel.deaths_in_outpatient_clinics!;
     cases_of_deaths_occurred_in_departments_of_hypnosis.text=c.deathsModel.cases_of_deaths_occurred_in_departments_of_hypnosis!;


    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is SetDeathModeldataSuccesState){
          MainCubit.get(context).getDeathModeldata(year);



        }
        if(state is GetDeathModeldataSuccesState){
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
                              Text(' عدد حالات الوفاة المسجلة'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_registered_deaths,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_registered_deaths.text,
                                  hint:n_of_registered_deaths.text


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
                              Text('حالات وصلت بعد الوفاة للمستشفى'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: cases_arrived_after_death_to_hospital,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: cases_arrived_after_death_to_hospital.text,
                                  hint:cases_arrived_after_death_to_hospital.text


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
                              Text('حالات وفاة بالعیادات الخارجیة والطواريء'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: deaths_in_outpatient_clinics,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: deaths_in_outpatient_clinics.text,
                                  hint:deaths_in_outpatient_clinics.text


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
                              Text('حالات الوفیات التى حدثت بأقسام التنویم'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: cases_of_deaths_occurred_in_departments_of_hypnosis,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: cases_of_deaths_occurred_in_departments_of_hypnosis.text,
                                  hint:cases_of_deaths_occurred_in_departments_of_hypnosis.text


                              ),
                            ],
                          ),
                        ),
                      ),





                      const SizedBox(
                        height: 20,
                      ),


                      ConditionalBuilder(condition:state is! SetDeathModeldataLoadingState&&
                          state is!SetDeathModeldataSuccesState&&state is! GetDeathModeldataLoadingState,
                          builder: (context)=>Center(
                            child: defaultMaterialButton(

                              function: () {
                      c.setDeathModeldata(
                      year: year,
                      departName: 'death',
    n_of_registered_deaths: n_of_registered_deaths.text,
    cases_arrived_after_death_to_hospital: cases_arrived_after_death_to_hospital.text,
    deaths_in_outpatient_clinics: deaths_in_outpatient_clinics.text,
    cases_of_deaths_occurred_in_departments_of_hypnosis: cases_of_deaths_occurred_in_departments_of_hypnosis.text);},
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
