import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screen/search_screen.dart';
import 'package:news_app/network/remote/dio.dart';
import 'package:news_app/newsCubit/cubitChangeThemeMode.dart';
import 'package:news_app/newsCubit/newsStates.dart';
import 'package:news_app/shared/component/componenets.dart';

import '../newsCubit/cubit.dart';

class homeLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>newsCubit()..getBussinessdata(),
      child: BlocConsumer<newsCubit,newsStates>(
        listener: (context,state){

        },
        builder: (context,state)
        {
          newsCubit cubit = newsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions:  [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: ()
                {
                  navigateTo(context, searchScreen());
                },),
              IconButton(
                icon: Icon(Icons.brightness_4_rounded),
                onPressed: ()
                {
                   cubitChangeThemeMode.get(context).changeAppMood();

                },),

            ],
          ),

          bottomNavigationBar: BottomNavigationBar(items:cubit.navBarItem ,
              currentIndex: cubit.currentIndex,
            onTap: (index){
            cubit.changeBottomNavItem(index);

            },
          ),

         body: cubit.screens[cubit.currentIndex],

        );
        }
      ),
    );
  }
}
