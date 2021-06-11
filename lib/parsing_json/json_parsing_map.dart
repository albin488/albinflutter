import 'dart:convert';

import 'package:albinflutter/model/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingMap extends StatefulWidget {


  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network=Network("https://jsonplaceholder.typicode.com/posts");
    data=network.loadPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Albin PODO"),
        ),
        body: Center(
          child: Container(
              child: FutureBuilder(
                  future: data,
                  builder: (context, AsyncSnapshot<PostList> snapshot) {
                    List<Post>allPosts;
                    if (snapshot.hasData) {
                      allPosts = snapshot.data.posts;
                        return createListView(allPosts,context);
                     // return Text("${allPosts[0].title}");
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
          ),
        ),);
  }
  Widget createListView(List<Post> data,BuildContext context){

    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,int index){
            return Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(height: 5.0,),
                ListTile(
                  title: Text("${data[index].title}"),
                  subtitle: Text("${data[index].body}"),
                  leading: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink.shade400,
                        radius: 23,
                        child: Text("${data[index].id}"),
                      )
                    ],
                  ),
                )
              ],);
          }),
    );
  }
}
class Network{
  final String url;
  Network(this.url);

  Future<PostList> loadPost()async{
    final son=Uri.parse(url);
      var uri= await get(son);
      Response response=uri;
      if(response.statusCode==200){
        var resp=PostList.fromJson(json.decode(response.body));
        return resp;
      }else{
            print(response.statusCode);
            throw Exception("failed to get posts");
           }
  }

  // Future fetchData()async{
  //   print("$url");
  //   var son=Uri.parse(url);
  //   var uri= await get(son);
  //   Response response=uri;
  //   if(response.statusCode==200){
  //     var resp=json.decode(response.body);
  //     print(resp);
  //     return resp;
  //   }else{
  //     print(response.statusCode);
  //   }
  // }
}