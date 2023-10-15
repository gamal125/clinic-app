import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Layouts/componentes.dart';
import '../models/workForceModel.dart';
import 'editScreens/editScreen6.dart';

class Workforce extends StatefulWidget {
  const Workforce({super.key});

  @override
  State<Workforce> createState() => _WorkforceState();
}

class _WorkforceState extends State<Workforce> {
  int years=int.parse( DateFormat('yyyy').format(DateTime.now())) ;

  String? selectedValue= DateFormat('yyyy').format(DateTime.now());
  var x=false;


  @override
  Widget build(BuildContext context) {
    var c=MainCubit.get(context);
    c.workForceModel.n_doctors ??= '0';
    c.workForceModel.n_specialists??='0';
    c.workForceModel.n_Dentists??='0';
    c.workForceModel.n_nurses??='0';
    c.workForceModel.n_of_Dental_technician??='0';
    c.workForceModel.n_Laboratory_technician??='0';
    c.workForceModel.n_Pharmacists ??= '0';
    c.workForceModel.n_helper_Pharmacists??='0';
    c.workForceModel.n_of_Nutrition_technician??='0';
    c.workForceModel.n_health_education??='0';
    c.workForceModel.n_dressers??='0';
    c.workForceModel.medical_records??='0';
    c.workForceModel.other_technical_categories??='0';
    c.workForceModel.other_administrative_categories??='0';
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
                                c.workForceModel.n_doctors = '0';
                                c.workForceModel.n_specialists='0';
                                c.workForceModel.n_Dentists='0';
                                c.workForceModel.n_nurses='0';
                                c.workForceModel.n_of_Dental_technician='0';
                                c.workForceModel.n_Laboratory_technician='0';
                                c.workForceModel.n_Pharmacists = '0';
                                c.workForceModel.n_helper_Pharmacists='0';
                                c.workForceModel.n_of_Nutrition_technician='0';
                                c.workForceModel.n_health_education='0';
                                c.workForceModel.n_dressers='0';
                                c.workForceModel.medical_records='0';
                                c.workForceModel.other_technical_categories='0';
                                c.workForceModel.other_administrative_categories='0';
                                c.getWorkForceModeldata(selectedValue);
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
                          navigateTo(context, editScreen6(
                            year: selectedValue!,));},
                            icon: Icon(Icons.edit))
                      ],
                    ),

                    x==true? Items():Items2(c.workForceModel),




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
        children: const [
          Text('0'),
          Text('عدد الأطباء')
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
        children: const [
          Text('0'),
          Text('عدد الاخصائیین')
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
        children: const [
          Text('0'),
          Text('عدد أطباء الأسنان')
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
        children: const [
          Text('0'),
          Text('عدد الممرضیین')
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
        children: const [
          Text('0'),
          Text('عدد فني الأسنان')
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
        children: const [
          Text('0'),
          Text('عدد فني المختبر')
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
        children: const [
          Text('0'),
          Text('عدد الصیادلة')
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
        children: const [
          Text('0'),
          Text(' عدد مساعدي الصیدلة')
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
        children: const [
          Text('0'),
          Text('عدد فني التغذیة')
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
        children: const [
          Text('0'),
          Text('التثقیف الصحي')
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
        children: const [
          Text('0'),
          Text(' عدد المضمدین')
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
        children: const [
          Text('0'),
          Text('السجلات الطبیة')
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
        children: const [
          Text('0'),
          Text('الفئات الاخرى الفنیة')
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
        children: const [
          Text('0'),
          Text('الفئات الاخرى الاداریة')
        ],
      ),
    ),
  ),




],);
Widget Items2(WorkForceModel model)=>Column(children: [
  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(height: 120, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue.withOpacity(0.2),

      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text('${model.n_doctors}'),
          Text('عدد الأطباء'),
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
        children:  [
          Text('${model.n_specialists}'),
          Text('عدد الاخصائیین'),
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
        children:  [
          Text('${model.n_Dentists}'),
          Text('عدد أطباء الأسنان'),
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
        children:   [
          Text('${model.n_nurses}'),
          Text('عدد الممرضیین'),
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
        children:   [
          Text('${model.n_of_Dental_technician}'),
          Text('عدد فني الأسنان'),
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
        children:   [
          Text('${model.n_Laboratory_technician}'),
          Text('عدد فني المختبر'),
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
        children:   [
          Text('${model.n_Pharmacists}'),
          Text('عدد الصیادلة'),
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
        children:   [
          Text('${model.n_helper_Pharmacists}'),
          Text(' عدد مساعدي الصیدلة'),
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
        children:   [
          Text('${model.n_of_Nutrition_technician}'),
          Text('عدد فني التغذیة'),
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
        children:   [
          Text('${model.n_health_education}'),
          Text('التثقیف الصحي'),
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
        children:  [
          Text('${model.n_dressers}'),
          const Text(' عدد المضمدین'),
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
        children:   [
          Text('${model.medical_records}'),
          Text('السجلات الطبیة'),
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
        children:  [
          Text('${model.other_technical_categories}'),
          Text('الفئات الاخرى الفنیة'),
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
        children:  [
          Text('${model.other_administrative_categories}'),
          Text('الفئات الاخرى الاداریة'),
        ],
      ),
    ),
  ),




],);
