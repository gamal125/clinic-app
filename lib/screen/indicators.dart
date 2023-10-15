import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/models/measuresModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Layouts/componentes.dart';
import 'editScreens/editScreen2.dart';
import 'editScreens/editScreen5.dart';

class Indicators extends StatefulWidget {
  const Indicators({super.key});

  @override
  State<Indicators> createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators> {
  int years=int.parse( DateFormat('yyyy').format(DateTime.now())) ;

  String? selectedValue= DateFormat('yyyy').format(DateTime.now());
  var x=false;

  @override
  Widget build(BuildContext context) {
    var c=MainCubit.get(context);
    c.measuresModel.n_of_residents_served_by_hospital ??= '0';
    c.measuresModel.n_of_residents_served_by_health_complex??='0';
    c.measuresModel.n_of_ambulances??='0';
    c.measuresModel.population_per_hospital_bed??='0';
    c.measuresModel.distance_to_reference_hospital??='0';
    c.measuresModel.time_to_reference_hospital??='0';

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
                                x=false;
                                c.measuresModel.n_of_residents_served_by_hospital = '0';
                                c.measuresModel.n_of_residents_served_by_health_complex='0';
                                c.measuresModel.n_of_ambulances='0';
                                c.measuresModel.population_per_hospital_bed='0';
                                c.measuresModel.distance_to_reference_hospital='0';
                                c.measuresModel.time_to_reference_hospital='0';
                                c.getMeasuresModeldata(selectedValue);
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
                          navigateTo(context, editScreen5(
                            year: selectedValue!,));},
                            icon: Icon(Icons.edit))
                      ],
                    ),

                    x==true? Items():Items2(c.measuresModel),




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
          Text('عدد السكان الذین یخدمھم المستشفى')
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
          Text('عدد السكان الذین یخدمھم المجمع الصحي')
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
          Text('عدد سیارات الاسعاف')
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
          Text(' السكان لكل سریر بالمستشفى')
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
          Text(' المسافة الى المستشفى المرجعي')
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
          Text('الزمن الى المستشفى المرجعي')
        ],
      ),
    ),
  ),




],);
Widget Items2(MeasuresModel model)=>Column(children: [
  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(height: 120, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue.withOpacity(0.2),

      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${model.n_of_residents_served_by_hospital}'),
          Text('عدد السكان الذین یخدمھم المستشفى'),
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
          Text('${model.n_of_residents_served_by_health_complex}'),
          Text('عدد السكان الذین یخدمھم المجمع الصحي'),
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
          Text('${model.n_of_ambulances}'),
          Text('عدد سیارات الاسعاف'),
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
          Text('${model.population_per_hospital_bed}'),
          Text(' السكان لكل سریر بالمستشفى'),
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
          Text('${model.distance_to_reference_hospital}'),
          Text(' المسافة الى المستشفى المرجعي'),
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
          Text('${model.time_to_reference_hospital}'),
          Text('الزمن الى المستشفى المرجعي'),
        ],
      ),
    ),
  ),




],);

