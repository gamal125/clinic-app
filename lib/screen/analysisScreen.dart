

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/models/analysisModel.dart';
import 'package:clinics/models/noteModel.dart';
import 'package:clinics/screen/editScreens/addAnalysisScreen.dart';
import 'package:clinics/screen/editScreens/addNoteScreen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class analysisScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {

     var c= MainCubit.get(context);


    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {


      },
      builder: (context, state) {

        return Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){navigateTo(context, addAnalysisScreen());}, icon: Icon(Icons.add))
            ],
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
              child: ConditionalBuilder(

                builder:( context) => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                 child: Column(children: [
                   ListView.separated(
                     shrinkWrap: true,
                     physics: const BouncingScrollPhysics(),
                     itemBuilder: (context, index) => notelist(
                         MainCubit.get(context).analysisModel[index], context),
                     separatorBuilder: (context, index) => myDivider(),
                     itemCount: MainCubit.get(context).analysisModel.length,
                   ),
                 ],),
                ), condition: MainCubit.get(context).analysisModel.isNotEmpty&& state is! DeleteAnalysisModeldataLoadingState, fallback: (context)=> Center(child: Text('لا توجد اي تحليل')),
              ),
            ),
          ),
        );
      },
    );
  }
}
Widget notelist(AnalysisModel model,context)=>Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Dismissible(
    key: Key(model.analy!),
    onDismissed: (direction){
      MainCubit.get(context).deleteAnalysisModeldata(model.analy);


    },
    child: Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12),

        color: Colors.lightBlue.withOpacity(0.2),



      ),
      child: Center(child: SingleChildScrollView(

          scrollDirection: Axis.vertical,

          child: Padding(

            padding: const EdgeInsets.all(12.0),

            child: Text('${model.analy}',maxLines: 10,overflow: TextOverflow.ellipsis,),

          ))),
    ),
  ),
);