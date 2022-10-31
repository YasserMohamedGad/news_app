import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/newsCubit/cubit.dart';
import 'package:news_app/newsCubit/newsStates.dart';
import 'package:news_app/shared/component/componenets.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class sportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // var sports=newsCubit.get(context).sports;
    return BlocConsumer<newsCubit,newsStates>(
      listener: (context, state)
      {  },
      builder: (context,state)
      {
        var list= newsCubit.get(context).sports;
        return  articaleBulider(list);


      },

    );
  }
}
