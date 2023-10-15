

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class editScreen5 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var n_of_residents_served_by_hospital=TextEditingController();
  var n_of_residents_served_by_health_complex=TextEditingController();
  var n_of_ambulances=TextEditingController();
  var population_per_hospital_bed=TextEditingController();
  var distance_to_reference_hospital=TextEditingController();
  var time_to_reference_hospital=TextEditingController();


  editScreen5({
    required this.year,
    });
  String year;
  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);


     n_of_residents_served_by_hospital.text=c.measuresModel.n_of_residents_served_by_hospital!;
     n_of_residents_served_by_health_complex.text=c.measuresModel.n_of_residents_served_by_health_complex!;
     n_of_ambulances.text=c.measuresModel.n_of_ambulances!;
     population_per_hospital_bed.text=c.measuresModel.population_per_hospital_bed!;
     distance_to_reference_hospital.text=c.measuresModel.distance_to_reference_hospital!;
     time_to_reference_hospital.text=c.measuresModel.time_to_reference_hospital!;


    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is SetMeasuresModeldataSuccesState){
          MainCubit.get(context).getMeasuresModeldata(year);



        }
        if(state is GetMeasuresModeldataSuccesState){
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
                              Text('عدد السكان الذین یخدمھم المستشفى'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_residents_served_by_hospital,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_residents_served_by_hospital.text,
                                  hint:n_of_residents_served_by_hospital.text


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
                              Text('عدد السكان الذین یخدمھم المجمع الصحي'),                          defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_residents_served_by_health_complex,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_residents_served_by_health_complex.text,
                                  hint:n_of_residents_served_by_health_complex.text


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
                              Text('عدد سیارات الاسعاف'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_ambulances,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_ambulances.text,
                                  hint:n_of_ambulances.text


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
                              Text(' السكان لكل سریر بالمستشفى'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: population_per_hospital_bed,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: population_per_hospital_bed.text,
                                  hint:population_per_hospital_bed.text


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
                              Text(' المسافة الى المستشفى المرجعي'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: distance_to_reference_hospital,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: distance_to_reference_hospital.text,
                                  hint:distance_to_reference_hospital.text


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
                              Text('الزمن الى المستشفى المرجعي'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: time_to_reference_hospital,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: time_to_reference_hospital.text,
                                  hint:time_to_reference_hospital.text


                              ),
                            ],
                          ),
                        ),
                      ),





                      const SizedBox(
                        height: 20,
                      ),


                      ConditionalBuilder(condition:state is! SetMeasuresModeldataLoadingState&&
                          state is!SetMeasuresModeldataSuccesState&&state is! GetMeasuresModeldataLoadingState,
                          builder: (context)=>Center(
                            child: defaultMaterialButton(

                              function: () {
                                c.setMeasuresModeldata(
                                    year: year,
                                    departName: "measures",
                                    n_of_residents_served_by_hospital: n_of_residents_served_by_hospital.text,
                                    n_of_residents_served_by_health_complex: n_of_residents_served_by_health_complex.text,
                                    n_of_ambulances: n_of_ambulances.text,
                                    population_per_hospital_bed: population_per_hospital_bed.text,
                                    distance_to_reference_hospital: distance_to_reference_hospital.text,
                                    time_to_reference_hospital: time_to_reference_hospital.text);
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
