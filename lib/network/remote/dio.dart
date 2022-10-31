import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class dioHelper{

  static Dio? dio;

  static init(){

    dio=Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getdata({
  @required String? url,
  @required Map<String,dynamic> ?query,
})
async{
    return await dio!.get(url!,queryParameters: query,

    );


}




}





//https://newsapi.org/v2/top-headlines?country=eg&apiKey=f9082247b72a4ac4a3cd4a16931c9b75
//baseurl:https://newsapi.org/
//method: v2/top-headlines
//qures:country=eg&apiKey=f9082247b72a4ac4a3cd4a16931c9b75