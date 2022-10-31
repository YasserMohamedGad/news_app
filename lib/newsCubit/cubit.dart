import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/businessScreen/businessScreen.dart';
import 'package:news_app/modules/scienceScreen/ScienceScreen.dart';
import 'package:news_app/modules/settingScreen/settingScreen.dart';
import 'package:news_app/modules/sportsScreen/sportsScreen.dart';
import 'package:news_app/network/remote/SharedPrefrance.dart';
import 'package:news_app/network/remote/dio.dart';
import 'package:news_app/newsCubit/newsStates.dart';

class newsCubit extends Cubit<newsStates>{
  newsCubit() :super(intialState());
  static newsCubit get(context)=> BlocProvider.of(context);

int currentIndex=0;
List<Widget>screens=[
  businessScreen(),
  sportsScreen(),
  scienceScreen(),

];
   List<BottomNavigationBarItem> navBarItem=[
     BottomNavigationBarItem(icon:Icon(Icons.business),
  label: "Business",

),
     BottomNavigationBarItem(icon:Icon(Icons.sports),
       label: "Sports",

     ),
     BottomNavigationBarItem(icon:Icon(Icons.science_outlined),
       label: "Science",

     ),


   ];
   void changeBottomNavItem(int index){
     currentIndex=index;
     if(index==1)
       getSportsdata();
     if(index==2)
       getSciencedata();

     emit(changeBottomNavBarItem());
   }

   List <dynamic>business=[];

    void getBussinessdata(){
      emit(newsGetBussinessDataLoadingState());
      dioHelper.getdata(url:"v2/top-headlines",
          query:
          {
            "country" : "eg",
            "category" : "business",
            "apiKey" : "f9082247b72a4ac4a3cd4a16931c9b75" ,


          }).then((value) {

            business=value.data['articles'];
        print(business[0]['title']);
            emit(newsGetBussinessDataSuccessState());

      }).catchError((error){

        print(error.toString());
        emit(newsGetBussinessDataErrorState(error.toString()));
      });

   }


  List <dynamic>sports=[];

  void getSportsdata(){
    emit(newsGetSportsDataLoadingState());
    if(sports.length==0)
    {
      dioHelper.getdata(url:"v2/top-headlines",
          query:
          {
            "country" : "eg",
            "category" : "sports",
            "apiKey" : "f9082247b72a4ac4a3cd4a16931c9b75" ,

          }).then((value) {

        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(newsGetSportsDataSuccessState());

      }).catchError((error){

        print(error.toString());
        emit(newsGetSportsDataErrorState(error.toString()));
      });

    }
   else
      emit(newsGetSportsDataSuccessState());

  }




  List <dynamic>science=[];

  void getSciencedata(){
    emit(newsGetScienceDataLoadingState());
    if(science.length==0)
    {
      dioHelper.getdata(url:"v2/top-headlines",
          query:
          {
            "country" : "eg",
            "category" : "science",
            "apiKey" : "f9082247b72a4ac4a3cd4a16931c9b75" ,

          }
          ,



    ).then((value) {

        science=value.data['articles'];

        print(science[0]['title']);
        emit(newsGetScienceDataSuccessState());

      }).catchError((error){

        print(error.toString());
        emit(newsGetScienceDataErrorState(error.toString()));
      });
    }
    else
      emit(newsGetScienceDataSuccessState());
  }



  List <dynamic>search=[];

  void getSearchdata(String searchData){

    emit(newsGetSearchDataLoadingState());

    dioHelper.getdata(url:"v2/everything",
      query:
      {

        "q" : "$searchData",
        "apiKey" : "f9082247b72a4ac4a3cd4a16931c9b75" ,

      }
      ,

    ).then((value) {

      search=value.data['articles'];

      print(search[0]['title']);
      emit(newsGetSearchDataSuccessState());

    }).catchError((error){

      print(error.toString());
      emit(newsGetSearchDataErrorState(error.toString()));
    });

  }



}

//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=f9082247b72a4ac4a3cd4a16931c9b75


























