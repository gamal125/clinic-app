import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/models/admitted.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Layouts/componentes.dart';
import 'editScreens/editScreen3.dart';

class Care extends StatefulWidget {
  const Care({super.key});

  @override
  State<Care> createState() => _CareState();
}

class _CareState extends State<Care> {
  int years=int.parse( DateFormat('yyyy').format(DateTime.now())) ;

  String? selectedValue= DateFormat('yyyy').format(DateTime.now());
  var x=false;
  @override
  Widget build(BuildContext context) {
    var c=MainCubit.get(context);
    c.admittedModel.n_official_family ??= '0';
    c.admittedModel.n_families_in_child_delinquency??='0';
    c.admittedModel.n_of_beds_in_internal_delinquency??='0';
    c.admittedModel.n_of_beds_in_delinquency_of_women??='0';
    c.admittedModel.n_of_placements??='0';
    c.admittedModel.family_occupancy_rate??='0';
    c.admittedModel.av_period_of_hypnosis??='0';
    c.admittedModel.av_hypnotists_per_day??='0';
    c.admittedModel.av_of_sleepers_per_day??='0';
    c.admittedModel.bed_turnover_rate??='0';
    c.admittedModel.Bed_rest_period_between_patients??='0';
    c.admittedModel.hospital_death_rate??='0';
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
                                c.admittedModel.n_official_family = '0';
                                c.admittedModel.n_families_in_child_delinquency='0';
                                c.admittedModel.n_of_beds_in_internal_delinquency='0';
                                c.admittedModel.n_of_beds_in_delinquency_of_women='0';
                                c.admittedModel.n_of_placements='0';
                                c.admittedModel.family_occupancy_rate='0';
                                c.admittedModel.av_period_of_hypnosis='0';
                                c.admittedModel.av_hypnotists_per_day='0';
                                c.admittedModel.av_of_sleepers_per_day='0';
                                c.admittedModel.bed_turnover_rate='0';
                                c.admittedModel.Bed_rest_period_between_patients='0';
                                c.admittedModel.hospital_death_rate='0';
                                c.getAdmittedModeldata(selectedValue);
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
                        navigateTo(context, editScreen3(
                          year: selectedValue!,));},
                          icon: Icon(Icons.edit))
                      ],
                    ),

                    x==true? Items():Items2(c.admittedModel),




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
          Text('عدد الاسرة الرسمي')
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
          Text(' عدد الأسرة في جناح الاطفال ')
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
          Text(' عدد الأسرة في جناح الباطني')
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
          Text('عدد الأسرة في جناح نساء وولادة')
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
          Text('العدد الكلي لحالات الترقید')
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
          Text('معدل اشغال الاسرة')
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
          Text(' متوسط فترة التنویم"بالایام "')
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
          Text('متوسط عددالمنومین یومیا')
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
          Text('متوسط عدد المرقدین فى الیوم')
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
          Text(' معدل دوران السریر')
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
          Text(' فترة خلو السریر بین المرضى')
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
          Text('معدل الوفاة بالمستشفى')
        ],
      ),
    ),
  ),



],);
Widget Items2(AdmittedModel admittedModel)=>Column(children: [
  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(height: 120, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue.withOpacity(0.2),

      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${admittedModel.n_official_family}'),
          Text('عدد الاسرة الرسمي')
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
          Text('${admittedModel.n_families_in_child_delinquency}'),
          Text(' عدد الأسرة في جناح الاطفال '),
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
          Text('${admittedModel.n_of_beds_in_internal_delinquency}'),
          Text(' عدد الأسرة في جناح الباطني')
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
          Text('${admittedModel.n_of_beds_in_delinquency_of_women}'),
          Text('عدد الأسرة في جناح نساء وولادة')
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
          Text('${admittedModel.n_of_placements}'),
          Text('العدد الكلي لحالات الترقید')
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
          Text('${admittedModel.family_occupancy_rate}'),
          Text('معدل اشغال الاسرة')
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
          Text('${admittedModel.av_period_of_hypnosis}'),
          Text(' متوسط فترة التنویم"بالایام "')
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
          Text('${admittedModel.av_hypnotists_per_day}'),
          Text('متوسط عددالمنومین یومیا')
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
          Text('${admittedModel.av_of_sleepers_per_day}'),
          Text('متوسط عدد المرقدین فى الیوم')
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
          Text('${admittedModel.bed_turnover_rate}'),
          Text(' معدل دوران السریر')
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
          Text('${admittedModel.Bed_rest_period_between_patients}'),
          Text(' فترة خلو السریر بین المرضى')
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
          Text('${admittedModel.hospital_death_rate}'),
          Text('معدل الوفاة بالمستشفى'),
        ],
      ),
    ),
  ),



],);

