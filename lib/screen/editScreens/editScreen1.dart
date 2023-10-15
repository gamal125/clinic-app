

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class editScreen1 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();


  var n_lab_tests=TextEditingController();
  var av_day=TextEditingController();
  var av_lab_technician_per_day=TextEditingController();
  var per_petient_test=TextEditingController();
  var n_rays_test=TextEditingController();
  var daily_rate=TextEditingController();
  var av_rays_foreach_tech=TextEditingController();
  var av_rays_foreach_petiant=TextEditingController();


  editScreen1({
    required this.year,
    });
  String year;
  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);
     n_lab_tests.text=c.labModel.n_lab_tests!;
     av_day.text=c.labModel.av_day!;
     av_lab_technician_per_day.text=c.labModel.av_lab_technician_per_day!;
     per_petient_test.text=c.labModel.per_petient_test!;
     n_rays_test.text=c.labModel.n_rays_test!;
     daily_rate.text=c.labModel.daily_rate!;
     av_rays_foreach_tech.text=c.labModel.av_rays_foreach_tech!;
     av_rays_foreach_petiant.text=c.labModel.av_rays_foreach_petiant!;

    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is SetLabModeldataSuccesState){
          MainCubit.get(context).getLabModeldata(year);



        }
        if(state is GetLabModeldataSuccesState){
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

                              Text('عدد الفحوصات المعملیه'),

                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_lab_tests,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_lab_tests.text,
                                  hint:n_lab_tests.text


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
                              Text('المتوسط الیومي'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_day,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_day.text,
                                  hint:av_day.text


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

                              Text('المتوسط لكل فني مختبر في الیوم'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_lab_technician_per_day,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_lab_technician_per_day.text,
                                  hint:av_lab_technician_per_day.text


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

                              Text('نسبة فحوصات المنومین'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: per_petient_test,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: per_petient_test.text,
                                  hint:per_petient_test.text


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
                              Text('عدد فحوصات الاشعة '),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: n_rays_test,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: n_rays_test.text,
                                  hint:n_rays_test.text


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
                              Text('المعدل الیومي " لكل الایام "'),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: daily_rate,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: daily_rate.text,
                                  hint:daily_rate.text


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
                              Text('متوسط عملیات الاشعة لكل فني اشعه في الیوم '),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_rays_foreach_tech,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_rays_foreach_tech.text,
                                  hint:av_rays_foreach_tech.text


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
                              Text(' نسبة أشعات المنومین '),
                              defaultTextFormField(

                                  onTap: (){

                                  },
                                  controller: av_rays_foreach_petiant,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.edit,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter amount ';
                                    }
                                    return null;
                                  },
                                  label: av_rays_foreach_petiant.text,
                                  hint:av_rays_foreach_petiant.text


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
                 c.setLabModeldata(
                     year: year,
                     departName: 'lab',
                     n_lab_tests: n_lab_tests.text,
                     av_day: av_day.text,
                     av_lab_technician_per_day: av_lab_technician_per_day.text,
                     per_petient_test: per_petient_test.text,
                     n_rays_test: n_rays_test.text,
                     daily_rate: daily_rate.text,
                     av_rays_foreach_tech: av_rays_foreach_tech.text,
                     av_rays_foreach_petiant: av_rays_foreach_petiant.text);

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
