import 'package:clinics/cubit/MainCubit.dart';
import 'package:clinics/cubit/MainStates.dart';
import 'package:clinics/models/labModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Layouts/componentes.dart';
import 'editScreens/editScreen1.dart';

class LaboratoryServices extends StatefulWidget {
  const LaboratoryServices({super.key});

  @override
  State<LaboratoryServices> createState() => _LaboratoryServicesState();
}

class _LaboratoryServicesState extends State<LaboratoryServices> {
  int years=int.parse( DateFormat('yyyy').format(DateTime.now())) ;

  String? selectedValue= DateFormat('yyyy').format(DateTime.now());
  var x=false;
  @override
  Widget build(BuildContext context) {
    var c=MainCubit.get(context);

    c.labModel.n_lab_tests ??= '0';
    c.labModel.av_day??='0';
    c.labModel.av_lab_technician_per_day??='0';
    c.labModel.per_petient_test??='0';
    c.labModel.n_rays_test??='0';
    c.labModel.daily_rate??='0';
    c.labModel.av_rays_foreach_tech??='0';
    c.labModel.av_rays_foreach_petiant??='0';
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
                                c.labModel.n_lab_tests = '0';
                                c.labModel.av_day='0';
                                c.labModel.av_lab_technician_per_day='0';
                                c.labModel.per_petient_test='0';
                                c.labModel.n_rays_test='0';
                                c.labModel.daily_rate='0';
                                c.labModel.av_rays_foreach_tech='0';
                                c.labModel.av_rays_foreach_petiant='0';
                                c.getLabModeldata(selectedValue);
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
                        navigateTo(context, editScreen1(
                          year: selectedValue!,));},
                          icon: Icon(Icons.edit))
                      ],
                    ),


                    x==true? Items():Items2(c.labModel),




                  ],)
            ),
          )
          );
        },
        listener: (context,state){
          if(state is GetLabModeldataSuccesState){
            setState(() {
              x=false;
            });
          }
        }
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
          Text('عدد الفحوصات المعملیه')
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
          Text('المتوسط الیومي')
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
          Text('المتوسط لكل فني مختبر في الیوم')
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
          Text('نسبة فحوصات المنومین')
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
          Text('عدد فحوصات الاشعة ')
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
          Text('المعدل الیومي " لكل الایام "')
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
          Text('متوسط عملیات الاشعة لكل فني اشعھ في الیوم ')
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
          Text(' نسبة أشعات المنومین ')
        ],
      ),
    ),
  ),



],);
Widget Items2(LabModel model)=>Column(children: [
  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(height: 120, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue.withOpacity(0.2),

      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${model.n_lab_tests}'),
          Text('عدد الفحوصات المعملیه')
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
          Text('${model.av_day}'),
          Text('المتوسط الیومي'),
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
          Text('${model.av_lab_technician_per_day}'),
          Text('المتوسط لكل فني مختبر في الیوم')
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
          Text('${model.per_petient_test}'),
          Text('نسبة فحوصات المنومین')
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
          Text('${model.n_rays_test}'),
          Text('عدد فحوصات الاشعة ')
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
          Text('${model.daily_rate}'),
          Text('المعدل الیومي " لكل الایام "')
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
          Text('${model.av_rays_foreach_tech}'),
          Text('متوسط عملیات الاشعة لكل فني اشعه في الیوم ')
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
          Text('${model.av_rays_foreach_petiant}'),
          Text(' نسبة أشعات المنومین ')
        ],
      ),
    ),
  ),



],);


