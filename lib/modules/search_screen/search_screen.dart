import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/newsCubit/cubit.dart';
import 'package:news_app/newsCubit/newsStates.dart';
import 'package:news_app/shared/component/componenets.dart';

class searchScreen extends StatelessWidget {
var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>newsCubit(),
      child: BlocConsumer<newsCubit,newsStates>(
        listener: (context,state)=>{},
        builder: (context,state){
           var list=newsCubit.get(context).search;
           return Scaffold(
             appBar: AppBar(
               iconTheme: Theme.of(context).appBarTheme.actionsIconTheme
             ),
            body: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search', prefixIcon:Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                    ),
                    onChanged: (value){
                     newsCubit.get(context).getSearchdata(value);
                    },
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return "Search can't be null";
                      }

                    },
                  ),
                ),
                Expanded(child: articaleBulider(list,isSearch: true)),
              ],
            ),
          );

        },
      ),
    );
  }
}
