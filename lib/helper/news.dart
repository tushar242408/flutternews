import 'dart:convert';

import 'package:futternews/models/articlemodel.dart';
import 'package:http/http.dart'as http;

class News{
  List<amodel> Amodel=[];
Future<void> getnews() async{
  String url1="http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=de14503d8934402797bd206910fba4cb";
  var response=await http.get(url1);
  var jasondata=jsonDecode(response.body);
  if(jasondata["status"]=="ok"){
    jasondata["articles"].forEach((element){
      if(element["urlToImage"]!=null && element["description"]!=null && element["title"]!=null){
        amodel a=amodel(
        tittle: element["title"],
        url:element["url"],
          urltomage: element["urlToImage"],
          author: element["author"],
          description: element["description"],
          content: element["content"],
        );
        Amodel.add(a);

      }
    }
    );
  }}

  Future<void> getnews1([String catogrie]) async{
    String url1="http://newsapi.org/v2/top-headlines?country=in&category=$catogrie&apiKey=de14503d8934402797bd206910fba4cb";
    var response=await http.get(url1);
    var jasondata=jsonDecode(response.body);
    if(jasondata["status"]=="ok"){
      jasondata["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null && element["title"]!=null){
          amodel a=amodel(
            tittle: element["title"],
            url:element["url"],
            urltomage: element["urlToImage"],
            author: element["author"],
            description: element["description"],
            content: element["content"],
          );
          Amodel.add(a);

        }
      }
      );
    }}








}