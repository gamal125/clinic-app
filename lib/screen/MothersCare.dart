import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/models/motherCareModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Layouts/componentes.dart';
import 'editScreens/editScreen.dart';
import 'editScreens/editScreen2.dart';

class MothersCare extends StatefulWidget {
  const MothersCare({super.key});

  @override
  State<MothersCare> createState() => _MothersCareState();
}

class _MothersCareState extends State<MothersCare> {
  int years=int.parse( DateFormat('yyyy').format(DateTime.now())) ;

  String? selectedValue= DateFormat('yyyy').format(DateTime.now());
  var x=false;
  @override
  Widget build(BuildContext context) {
    var c=MainCubit.get(context);
    c.mothersCare.n_pregnent_visits ??= '0';
    c.mothersCare.birth_spacing_visits??='0';
    c.mothersCare.per_low_birth_weight??='0';
    c.mothersCare.av_brithing_per_mounth??='0';
    c.mothersCare.n_brithing_in_hospital??='0';
    c.mothersCare.per_pregnancy_stress??='0';
    c.mothersCare.per_pregnancy_diabetes??='0';
    c.mothersCare.per_pregnancy_anemia??='0';
    c.mothersCare.per_visits_in_first_trimester??='0';
    c.mothersCare.n_mothers_visits_after_brith??='0';
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
                                c.mothersCare.n_pregnent_visits = '0';
                                c.mothersCare.birth_spacing_visits='0';
                                c.mothersCare.per_low_birth_weight='0';
                                c.mothersCare.av_brithing_per_mounth='0';
                                c.mothersCare.n_brithing_in_hospital='0';
                                c.mothersCare.per_pregnancy_stress='0';
                                c.mothersCare.per_pregnancy_diabetes='0';
                                c.mothersCare.per_pregnancy_anemia='0';
                                c.mothersCare.per_visits_in_first_trimester='0';
                                c.mothersCare.n_mothers_visits_after_brith='0';
                                c.getMotherModeldata(selectedValue);
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
                        navigateTo(context, editScreen2(
                          year: selectedValue!,));},
                          icon: Icon(Icons.edit))
                      ]
                      ,
                    ),

                    x==true? Items():Items2(c.mothersCare),




                  ],)
            ),
          )
          );
        },
        listener: (context,state){
          if(state is GetMotherModeldataSuccesState){
            setState(() {
              x=false;
            });
          }
        }
    );
  }
}
Widget Items()=> Column(children: [
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
          Text('اجمالي زیارات الحوامل')
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
          Text('عدد زیارات الامھات بعد الولادة')
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
          Text('نسبة الزیارات في الثلث الأول من الحمل')
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
          Text('نسبة حالات انیمیا الحمل ')
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
          Text('نسبة حالات سكري الحمل ')
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
          Text('نسبة حالات ضغط الحمل ')
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
          Text('اجمالى حالات الولادات بالمستشفي ')
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
          Text(' متوسط عدد الولادات شھریا')
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
          Text('نسبة ناقصي الوزن عند الولاده "من المولودین احیاء"')
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
          Text('زیارات المباعده بین الولادات')
        ],
      ),
    ),
  ),



],);
Widget Items2(MotherCareModel model)=> Column(children: [
  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(height: 120, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue.withOpacity(0.2),

      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${model.n_pregnent_visits}'),
          Text('اجمالي زیارات الحوامل')
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
          Text('${model.n_mothers_visits_after_brith}'),
          Text('عدد زیارات الامھات بعد الولادة')
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
          Text('${model.per_visits_in_first_trimester}'),
          Text('نسبة الزیارات في الثلث الأول من الحمل')
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
          Text('${model.per_pregnancy_anemia}'),
          Text('نسبة حالات انیمیا الحمل ')
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
          Text('${model.per_pregnancy_diabetes}'),
          Text('نسبة حالات سكري الحمل ')
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
          Text('${model.per_pregnancy_stress}'),
          Text('نسبة حالات ضغط الحمل ')
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
          Text('${model.n_brithing_in_hospital}'),
          Text('اجمالى حالات الولادات بالمستشفي ')
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
          Text('${model.av_brithing_per_mounth}'),
          Text(' متوسط عدد الولادات شھریا')
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
          Text('${model.per_low_birth_weight}'),
          Text('نسبة ناقصي الوزن عند الولاده "من المولودین احیاء"')
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
          Text('${model.birth_spacing_visits}'),
          Text('زیارات المباعده بین الولادات')
        ],
      ),
    ),
  ),



],);
