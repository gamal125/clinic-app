import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/models/deathsModel.dart';
import 'package:clinics/screen/editScreens/editScreen4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Layouts/componentes.dart';
import 'editScreens/editScreen2.dart';

class Deaths extends StatefulWidget {
  const Deaths({super.key});

  @override
  State<Deaths> createState() => _DeathsState();
}

class _DeathsState extends State<Deaths> {
  int years=int.parse( DateFormat('yyyy').format(DateTime.now())) ;

  String? selectedValue= DateFormat('yyyy').format(DateTime.now());
  var x=false;

  @override
  Widget build(BuildContext context) {
    var c=MainCubit.get(context);
    c.deathsModel.n_of_registered_deaths ??= '0';
    c.deathsModel.cases_arrived_after_death_to_hospital??='0';
    c.deathsModel.deaths_in_outpatient_clinics??='0';
    c.deathsModel.cases_of_deaths_occurred_in_departments_of_hypnosis??='0';
    final List<String> items = [
      '${years-2}',
      '${years-1}',
      '$years',


    ];


    return  BlocConsumer<MainCubit,MainStates>(
        builder:(context,state) {

          return SingleChildScrollView(child: Theme(
            data: myTheme,
            child: Container(

                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: DropdownButton<String>(
                            style: TextStyle(fontSize: 18,color: Colors.black),
                            value: selectedValue,
                            onChanged: ( newValue) {
                              setState(() {
                                selectedValue = newValue!;
                                c.deathsModel.n_of_registered_deaths = '0';
                                c.deathsModel.cases_arrived_after_death_to_hospital='0';
                                c.deathsModel.deaths_in_outpatient_clinics='0';
                                c.deathsModel.cases_of_deaths_occurred_in_departments_of_hypnosis='0';
                                c.getDeathModeldata(selectedValue);
                              });
                            },
                            items: items.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                        IconButton(onPressed: (){
                        navigateTo(context, editScreen4(
                          year: selectedValue!,));},
                          icon: Icon(Icons.edit))
                      ],
                    ),


                    x==true? Items():Items2(c.deathsModel),




                  ],)
            ),
          )
          );
        },
        listener: (context,state){}
    );
  }
}
Widget Items()=>Column(children: [
  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(height: 120, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue.withOpacity(0.2),

      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('0'),
          Text(' عدد حالات الوفاة المسجلة')
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
          Text('0'),
          Text('حالات وصلت بعد الوفاة للمستشفى')
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
          Text('0'),
          Text('حالات وفاة بالعیادات الخارجیة والطواريء')
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
          Text('0'),
          Text('حالات الوفیات التى حدثت بأقسام التنویم')
        ],
      ),
    ),
  ),




],);
Widget Items2(DeathsModel model)=>Column(children: [
  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(height: 120, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue.withOpacity(0.2),

      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${model.n_of_registered_deaths}'),
          Text(' عدد حالات الوفاة المسجلة'),
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
          Text('${model.cases_arrived_after_death_to_hospital}'),
          Text('حالات وصلت بعد الوفاة للمستشفى'),
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
          Text('${model.deaths_in_outpatient_clinics}'),
          Text('حالات وفاة بالعیادات الخارجیة والطواريء'),
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
          Text('${model.cases_of_deaths_occurred_in_departments_of_hypnosis}'),
          Text('حالات الوفیات التى حدثت بأقسام التنویم'),
        ],
      ),
    ),
  ),




],);
