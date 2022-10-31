import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news_app/modules/web_view/webView.dart';
import 'package:news_app/newsCubit/cubit.dart';

//var urlImage;

Widget bulidArticalItem( articales,context)=>InkWell(
  onTap: (){
    navigateTo(context, webViewScreen(articales['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(15.0),

    child:   Row(



      children:

      [



        ConditionalBuilder(condition:  articales['urlToImage'] == null ||  articales['url'] == null,

            builder: (context)=>Container(

              height: 120,

              width:120,

              decoration:BoxDecoration(

                borderRadius: BorderRadiusDirectional.circular(30),

                image: DecorationImage(image: AssetImage('assets/images/image-not-found.png'),fit: BoxFit.cover),

              ) ,



        ),

            fallback: (context)=>Container(

              height: 120,

              width:120,

              decoration:BoxDecoration(

                borderRadius: BorderRadiusDirectional.circular(30),

                image: DecorationImage(image:NetworkImage('${articales["urlToImage"]}') ,fit: BoxFit.cover),

              ) ,



            ), )



        ,

        SizedBox(

          width: 20,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text("${articales['title']}",

                    style: Theme.of(context).textTheme.bodyText1,



                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text("${articales["publishedAt"]}",

                  style: TextStyle(

                    color: Colors.grey,

                    fontWeight: FontWeight.w600,

                    fontSize: 18,

                  ),

                ),







              ],

            ),

          ),

        ),





      ],

    ),

  ),
);


Widget divider()=>Container(
  height: 2,
  width: 1,
  color: Colors.grey,
);

Widget articaleBulider(list,{isSearch=false})=>ConditionalBuilder(

      condition:   list.length>0,
      builder: (context) => ListView.separated(
        physics:BouncingScrollPhysics() ,
        itemBuilder: (context,index)=>bulidArticalItem(list[index],context),
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.all(8.0),
          child: divider(),
        ),
        itemCount: list.length,
      ),
      fallback: (context) =>isSearch?  Container()  : Center(child:CircularProgressIndicator() ),
    );

void navigateTo(context,Widget)=>Navigator.push(context,
    MaterialPageRoute(builder: (context)=>Widget) ) ;



