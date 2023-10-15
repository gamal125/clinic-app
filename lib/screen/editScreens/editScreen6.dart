

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class editScreen6 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();


  var n_doctors=TextEditingController();
  var n_specialists=TextEditingController();
  var n_Dentists=TextEditingController();

  var n_nurses=TextEditingController();
  var n_of_Dental_technician=TextEditingController();
  var n_Laboratory_technician=TextEditingController();

  var n_Pharmacists=TextEditingController();
  var n_helper_Pharmacists=TextEditingController();
  var n_of_Nutrition_technician=TextEditingController();

  var n_health_education=TextEditingController();
  var n_dressers=TextEditingController();
  var medical_records=TextEditingController();

  var other_technical_categories=TextEditingController();
  var other_administrative_categories=TextEditingController();



  editScreen6({
    required this.year,
    });
  String year;
  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);
     n_doctors.text=c.workForceModel.n_doctors!;
     n_specialists.text=c.workForceModel.n_specialists!;
     n_Dentists.text=c.workForceModel.n_Dentists!;
     n_nurses.text=c.workForceModel.n_nurses!;
     n_of_Dental_technician.text=c.workForceModel.n_of_Dental_technician!;
     n_Laboratory_technician.text=c.workForceModel.n_Laboratory_technician!;
     n_Pharmacists.text=c.workForceModel.n_Pharmacists!;
     n_helper_Pharmacists.text=c.workForceModel.n_helper_Pharmacists!;
     n_of_Nutrition_technician.text=c.workForceModel.n_of_Nutrition_technician!;
     n_health_education.text=c.workForceModel.n_health_education!;
     n_dressers.text=c.workForceModel.n_dressers!;
     medical_records.text=c.workForceModel.medical_records!;
     other_technical_categories.text=c.workForceModel.other_technical_categories!;
     other_administrative_categories.text=c.workForceModel.other_administrative_categories!;

    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is SetworkforceModeldataSuccesState){
          MainCubit.get(context).getWorkForceModeldata(year);



        }
        if(state is GetworkforceModeldataSuccesState){
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
                              Text('عدد الأطباء'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_doctors,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_doctors.text,
                                  hint:n_doctors.text


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

                              Text('عدد الاخصائیین'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_specialists,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_specialists.text,
                                  hint:n_specialists.text


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

                              Text('عدد أطباء الأسنان'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_Dentists,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_Dentists.text,
                                  hint:n_Dentists.text


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
                               Text('عدد الممرضیین'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_nurses,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_nurses.text,
                                  hint:n_nurses.text


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
                               Text('عدد فني الأسنان'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_Dental_technician,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_Dental_technician.text,
                                  hint:n_of_Dental_technician.text


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
                               Text('عدد فني المختبر'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_Laboratory_technician,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_Laboratory_technician.text,
                                  hint:n_Laboratory_technician.text


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
                               Text('عدد الصیادلة'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_Pharmacists,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_Pharmacists.text,
                                  hint:n_Pharmacists.text


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
                               Text(' عدد مساعدي الصیدلة'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_helper_Pharmacists,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_helper_Pharmacists.text,
                                  hint:n_helper_Pharmacists.text


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
                               Text('عدد فني التغذیة'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_of_Nutrition_technician,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_of_Nutrition_technician.text,
                                  hint:n_of_Nutrition_technician.text


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
                               Text('التثقیف الصحي'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller:n_health_education ,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_health_education.text,
                                  hint:n_health_education.text


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
                              const Text(' عدد المضمدین'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_dressers,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_dressers.text,
                                  hint:n_dressers.text


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
                              Text('السجلات الطبیة'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: medical_records,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: medical_records.text,
                                  hint:medical_records.text


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
                              Text('الفئات الاخرى الفنیة'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: other_technical_categories,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: other_technical_categories.text,
                                  hint:other_technical_categories.text


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
                              Text('الفئات الاخرى الاداریة'),                            defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller:other_administrative_categories ,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: other_administrative_categories.text,
                                  hint:other_administrative_categories.text


                              ),
                            ],
                          ),
                        ),
                      ),




                      const SizedBox(
                        height: 20,
                      ),


                      ConditionalBuilder(condition:state is! SetworkforceModeldataLoadingState&&
                          state is!SetworkforceModeldataSuccesState&&state is! GetworkforceModeldataLoadingState,
                          builder: (context)=>Center(
                            child: defaultMaterialButton(

                              function: () {
                         c.setWorkForceModeldata(
                             year: year,
                             departName: "WorkForce",
                             n_doctors: n_doctors.text,
                             n_specialists: n_specialists.text,
                             n_Dentists: n_Dentists.text,
                             n_nurses: n_nurses.text,
                             n_of_Dental_technician: n_of_Dental_technician.text,
                             n_Laboratory_technician: n_Laboratory_technician.text,
                             n_Pharmacists: n_Pharmacists.text,
                             n_helper_Pharmacists: n_helper_Pharmacists.text,
                             n_of_Nutrition_technician: n_of_Nutrition_technician.text,
                             n_health_education: n_health_education.text,
                             n_dressers: n_dressers.text,
                             medical_records: medical_records.text,
                             other_technical_categories: other_technical_categories.text,
                             other_administrative_categories: other_administrative_categories.text
                         );

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
