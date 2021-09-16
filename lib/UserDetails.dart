import 'package:flutter/material.dart';

class UserDetailsModel{

  String? displayName;
  String? email;
  String? photoURL;

  UserDetailsModel({this.displayName,this.email,this.photoURL});

  UserDetailsModel.fromJson(Map<String,dynamic>json){

    displayName=json["displayName"];
    email=json["email"];
    photoURL=json["photoURL"];
  }

  Map<String,dynamic>tojson(){

    final Map<String,dynamic> mapdata=new Map<String,dynamic>();
    mapdata["displayName"]=this.displayName;
    mapdata["email"]=this.email;
    mapdata["photoURL"]=this.photoURL;

    return mapdata;
  }
}