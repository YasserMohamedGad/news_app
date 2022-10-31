import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/homeLayout.dart';
import 'package:news_app/network/remote/SharedPrefrance.dart';
import 'package:news_app/network/remote/dio.dart';
import 'package:news_app/newsCubit/cubit.dart';
import 'package:news_app/newsCubit/cubitChangeThemeMode.dart';
import 'package:news_app/newsCubit/newsStates.dart';
import 'package:news_app/newsCubit/statesThemeMode.dart';
import 'package:news_app/shared/component/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  dioHelper.init();
  await casheHelper.init();
  bool? isDark=casheHelper.getBoolean(key: "isDark");
  runApp(MyApp(isDark));

}

class MyApp extends StatelessWidget {
   bool? isDark;
   MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>cubitChangeThemeMode()..changeAppMood(
          fromShared: isDark),
      child: BlocConsumer<cubitChangeThemeMode,newsAppChangeModeStates>(
        listener: (context,state)
        {

        },

        builder: (context,state) {

           return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
                primarySwatch: Colors.green,

                appBarTheme:  AppBarTheme(color: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,
                      fontWeight: FontWeight.bold),
                  actionsIconTheme: IconThemeData(color: Colors.black),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.dark

                  ),

                ),
                scaffoldBackgroundColor:Colors.white,
                textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedIconTheme: IconThemeData(color: Colors.green),
                  selectedItemColor: Colors.green,
                  unselectedIconTheme: IconThemeData(color: Colors.grey),
                  elevation: 20,
                ),

              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.green,


                appBarTheme:  AppBarTheme(color: HexColor('#303030'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(color:HexColor('#5db171'),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  actionsIconTheme: IconThemeData(color: HexColor('#5db171')),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('#303030'),
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.light,


                  ),

                ),
                scaffoldBackgroundColor: HexColor('#303030'),
                textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor('#303030'),
                  type: BottomNavigationBarType.fixed,
                  selectedIconTheme: IconThemeData(color: Colors.green),
                  selectedItemColor: Colors.green,
                  unselectedIconTheme: IconThemeData(color: Colors.grey),
                  elevation: 20,
                ),

              ),
              themeMode: cubitChangeThemeMode.get(context).isDark? ThemeMode.dark:ThemeMode.light,

              home:homeLayout()
          );


        },

      ),
    );
  }
}

