
import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/screen/notesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/analysisScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(

      listener: (context, state) => {

      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            leading:IconButton(onPressed: (){
              MainCubit.get(context).noteModel.clear();
              MainCubit.get(context).getNoteModeldata();

              navigateTo(context, notesScreen());},
                icon: Icon(Icons.library_books_outlined)),

            actions:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  IconButton(onPressed: (){
                    MainCubit.get(context).analysisModel.clear();
                    MainCubit.get(context).getAnalysisModeldata();

                    navigateTo(context, analysisScreen());},
                      icon: Icon(Icons.analytics_outlined)),
                  Padding(
            padding: const EdgeInsets.only(right: 18.0,left: 18),
            child: Center(child: Text(cubit.titles[cubit.currentIndex],style: const TextStyle(fontSize: 30),)),
          ),
                ],
              )],),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.blue,
            fixedColor:Colors.blue ,
            items: cubit.BottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),

        );
      },
    );
  }
}
