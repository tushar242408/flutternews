import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futternews/News/artticleviews.dart';
import 'package:futternews/News/catogoryview.dart';
import 'package:futternews/helper/data.dart';
import 'package:futternews/helper/news.dart';
import 'package:futternews/models/articlemodel.dart';
import 'package:futternews/models/catogorimodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Catogories> catogri=new List<Catogories>();
  List<amodel> news=new List<amodel>();
  bool loading=true;
  @override
  void initState() {
    // TODO: implement initState
    catogri=getcatogories();
    super.initState();
    getnews();
  }
  getnews() async{
    News data=News();
    await data.getnews();
    news=data.Amodel;
    setState(() {
      loading=false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("TUSHAR",style: TextStyle(color: Colors.blueAccent,fontSize: 18,fontWeight: FontWeight.bold),),
            Text("NEWS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15,),),
          ],

        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: loading? Center(child: CircularProgressIndicator(),) :SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height:70,
                child: ListView.builder(
              itemCount: catogri.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
    return CatogoryTile(imageurl:catogri[index].imgurl,catogoryname:catogri[index].Catogoriesname);
            }),
              ),
              Container(
                child: ListView.builder(
                  itemCount: news.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                    return Blogtile(imageurl: news[index].urltomage, desc: news[index].description, tittle: news[index].tittle,url: news[index].url,);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class CatogoryTile extends StatelessWidget {
final imageurl,catogoryname;
tap(){}


 CatogoryTile({this.catogoryname,this.imageurl});
  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>Catogoryview(
        catogrie: catogoryname.toString().toLowerCase(),
      ))),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
      children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(6),

                child: Image.network(imageurl,width: 120,height: 70,)),
               Container(
                 width: 120,
                 height: 70,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(6)
                 ),
                 child: Text(catogoryname, style: TextStyle(fontSize: 18),),



               ),

        ],
        ),
      ),
    );
  }
}

class Blogtile extends StatelessWidget {

  final String imageurl,tittle,desc,url;
  Blogtile({this.imageurl, this.desc, this.tittle,this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder:(context)=>
          Webview(url:url ,)
        ,
      )),
      child: Container(
        child: Column(
          children: <Widget>[
            Image.network(imageurl),
            Text(tittle,style: TextStyle(fontSize: 18,color: Colors.black),),
            Text(desc,style: TextStyle(fontSize: 14,color: Colors.black38),),
            

          ],
        ),
      ),
    );
  }
}
