import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/newsCubit/cubit.dart';
import 'package:news_app/newsCubit/newsStates.dart';
import 'package:news_app/shared/component/componenets.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class businessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   //var business=newsCubit.get(context).business;
    return BlocConsumer<newsCubit,newsStates>(
      listener: (context, state)
      {  },
      builder: (context,state)
      {
        var list= newsCubit.get(context).business;
      return  articaleBulider(list);


      },

    );
  }
}
