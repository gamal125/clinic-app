import 'package:clinics/Layouts/Home_Layout.dart';
import 'package:clinics/cubit/MainCubit.dart';

import 'package:clinics/cubit/MainStates.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clinics/bloc_observer.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'Layouts/componentes.dart';


void main() async{

  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var year=DateFormat('yyyy').format(DateTime.now());
    return  MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => MainCubit()..getClinicModeldata(year)

        ),
      ],
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return MaterialApp(

            theme: myTheme,
            debugShowCheckedModeBanner: false,
            home: SplashScreenView(
                duration: 5000,
                pageRouteTransition: PageRouteTransition.SlideTransition,
                navigateRoute: HomePage(),
                text: 'مؤشرات',
                textType: TextType.ColorizeAnimationText,
                textStyle: GoogleFonts.libreBaskerville(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),

                backgroundColor: Colors.white
            ),
          );
        },
      ),
    );
  }
}

