
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/newsCubit/statesThemeMode.dart';
import 'package:news_app/network/remote/SharedPrefrance.dart';
class cubitChangeThemeMode extends Cubit<newsAppChangeModeStates> {
  cubitChangeThemeMode() : super(intialState());
  static cubitChangeThemeMode get(context)=> BlocProvider.of(context);


  bool isDark = false;

  void changeAppMood({ bool? fromShared}) {
    if(fromShared != null){
       isDark=fromShared;
       emit(newschangeAppModeState());

    }else
    {
      isDark = !isDark;
      casheHelper.putBoolean(key: "isDark", value: isDark)!.then((value) {
        emit(newschangeAppModeState());
      });
    }
  }



}