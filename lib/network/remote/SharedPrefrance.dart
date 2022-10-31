import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class casheHelper {
 static late SharedPreferences sharedPreferevces;

static init() async{

    sharedPreferevces = await SharedPreferences.getInstance();
 }

static Future<bool>? putBoolean({
  required String? key,
  required bool? value,
})
async{
    return await sharedPreferevces.setBool(key!, value!);
}

 static bool? getBoolean({
   required String? key,

 })
 {
    return sharedPreferevces.getBool(key!);
 }


}