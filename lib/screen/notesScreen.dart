

import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/models/noteModel.dart';
import 'package:clinics/screen/editScreens/addNoteScreen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class notesScreen extends StatelessWidget {
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
              IconButton(onPressed: (){navigateTo(context, addNoteScreen());}, icon: Icon(Icons.note_add_outlined))
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
                         MainCubit.get(context).noteModel[index], context),
                     separatorBuilder: (context, index) => myDivider(),
                     itemCount: MainCubit.get(context).noteModel.length,
                   ),
                 ],),
                ), condition: MainCubit.get(context).noteModel.isNotEmpty&& state is! DeleteNoteModeldataLoadingState, fallback: (context)=> Center(child: Text('لا توجد ملاحظات')),
              ),
            ),
          ),
        );
      },
    );
  }
}
Widget notelist(NoteModel model,context)=>Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Dismissible(
    key: Key(model.note!),
    onDismissed: (direction){
      MainCubit.get(context).deleteNoteModeldata(model.note);


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

            child: Text('${model.note}',maxLines: 10,overflow: TextOverflow.ellipsis,),

          ))),
    ),
  ),
);