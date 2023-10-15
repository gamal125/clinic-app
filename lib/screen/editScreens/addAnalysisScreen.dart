

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class addAnalysisScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var analysis=TextEditingController();




  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);



    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is SetAnalysisModeldataSuccesState){
          MainCubit.get(context).getAnalysisModeldata();



        }
        if(state is GetAnalysisModeldataSuccesState){
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
                        child: Container( width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.withOpacity(0.2),

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            TextFormField(

textDirection: TextDirection.rtl,
                            maxLines: 30,
                            minLines: 20,
                            controller: analysis,
                            validator:  (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter amount ';
                              }
                              return null;
                            },
                            onTap: (){},
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.edit,
                                color: Colors.grey,
                              ),
                              filled: true,
                              isCollapsed: false,
                              fillColor: Colors.transparent,
                              hoverColor: Colors.red.withOpacity(0.2),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.cyan,
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                              labelText: 'اضافه تحليل',
                              labelStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.cyan,
                              ),
                              hintText: "",
                              hintStyle: const TextStyle(color: Colors.grey),
                              focusColor: Colors.black,
                              disabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),


                            ],
                          ),
                        ),
                      ),






                      const SizedBox(
                        height: 20,
                      ),


                      ConditionalBuilder(condition:state is! SetAnalysisModeldataLoadingState&&
                          state is!SetAnalysisModeldataSuccesState&&state is! GetAnalysisModeldataLoadingState,
                          builder: (context)=>Center(
                            child: defaultMaterialButton(

                              function: () {
      c.setAnalysisModeldata( analysis: analysis.text);},
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
