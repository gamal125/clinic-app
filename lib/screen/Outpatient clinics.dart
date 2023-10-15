import 'package:clinics/Layouts/componentes.dart';
import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/models/clinicsModel.dart';
import 'package:clinics/screen/editScreens/editScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OutpatientClinic extends StatefulWidget {
   OutpatientClinic({super.key});

  @override
  State<OutpatientClinic> createState() => _OutpatientClinicState();
}

class _OutpatientClinicState extends State<OutpatientClinic> {

  int years=int.parse( DateFormat('yyyy').format(DateTime.now())) ;
  String? selectedValue= DateFormat('yyyy').format(DateTime.now());
var x=false;



  @override
  Widget build(BuildContext context) {
    var c=MainCubit.get(context);

c.clinicmodel.n_reviewers ??= '0';
    c.clinicmodel.av_working??='0';
    c.clinicmodel.av_holiday??='0';
    c.clinicmodel.per_child_visit??='0';
    c.clinicmodel.per_adults_visit??='0';
    c.clinicmodel.n_dental_visits??='0';
    c.clinicmodel.av_visits_per_day??='0';

    final List<String> items = [
      '${years-2}',
          '${years-1}',
              '$years',


    ];


    return  BlocConsumer<MainCubit,MainStates>(

        builder:(context,state) {

        return SingleChildScrollView(child: Container(

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
                          c.clinicmodel.n_reviewers = '0';
                          c.clinicmodel.av_working='0';
                          c.clinicmodel.av_holiday='0';
                          c.clinicmodel.per_child_visit='0';
                          c.clinicmodel.per_adults_visit='0';
                          c.clinicmodel.n_dental_visits='0';
                          c.clinicmodel.av_visits_per_day='0';
                          c.getClinicModeldata(selectedValue);

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
                  IconButton(
                      onPressed: (){
                  navigateTo(context, editScreen(
                      year: selectedValue!,));},
                    icon: Icon(Icons.edit)),

                ],
                ),


               x==true? Items():Items2(c.clinicmodel),





            ],)
        )
        );
        },
        listener: (context,state){
          if(state is GetClinicModeldataSuccesState){
            setState(() {
              x=false;
            });
          }
        }
    );
  }
}
Widget Items()=>Theme(
  data: myTheme,
  child:   Column(children: [
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
            Text('إجمالي عدد المراجعين')
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
            Text('المتوسط الیومي ایام الدوام الرسمي ')
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
            Text('المتوسط الیومي " ایام الاجازات')
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
            Text('نسبة زیارات الاطفال')
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
            Text(' نسبة زیارات البالغین ')
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
            Text(' عدد زیارات عیادة الاسنان')
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
            Text('متوسط الزیارات الیومي')
          ],
        ),
      ),
    ),



  ],),
);
Widget Items2(ClinicModel model)=>Theme(
  data: myTheme,
  child:   Column(children: [
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(height: 120, width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.lightBlue.withOpacity(0.2),

        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${model.n_reviewers}'),
            Text('إجمالي عدد المراجعين')
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
            Text('${model.av_working}'),
            Text('المتوسط الیومي ایام الدوام الرسمي ')
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
            Text('${model.av_holiday}'),
            Text('المتوسط الیومي " ایام الاجازات')
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
            Text('${model.per_child_visit}'),
            Text('نسبة زیارات الاطفال')
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
            Text('${model.per_adults_visit}'),
            Text(' نسبة زیارات البالغین ')
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
            Text('${model.n_dental_visits}'),
            Text(' عدد زیارات عیادة الاسنان')
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
            Text('${model.av_visits_per_day}'),
            Text('متوسط الزیارات الیومي')
          ],
        ),
      ),
    ),



  ],),
);
