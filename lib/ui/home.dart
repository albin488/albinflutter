
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {



  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index=0;
  List quotes=[
    "A handle to the location of a widget in the widget tree.This class presents a set of methods that can be used from StatelessWidget.",
    " build methods and from methods on State objects BuildContext objects are passed to WidgetBuilder functions (such as StatelessWidget.build)," ,
    " and are available from the State.context member.Some static functions (e.g. showDialog, Theme.of, and so forth) also take build contexts so that they can act on behalf of the calling widget,",
    "or obtain data specifically for the given context.Each widget has its own BuildContext, which becomes the parent of the widget returned by the StatelessWidget.",
    "build or State.build function. (And similarly,the parent of any children for RenderObjectWidgets.) In particular, this means that within a build method,",
    "the build context of the widget of the build method is not the same as the build context of the widgets returned by that build method.",
    " This can lead to some tricky cases. For example, Theme.of(context) looks for the nearest enclosing Theme of the given build context.",
    " If a build method for a widget Q includes a Theme within its returned widget tree, and attempts to use Theme.of passing its own context,the build method for Q will not find that Theme object.",
    " It will instead find whatever Theme was an ancestor to the widget Q. If the build context for a subpart of the returned tree is needed,",
    " a Builder widget can be used: the build context passed to the Builder. builder callback will be that of the Builder itself.For example, in the following snippet, the ScaffoldState.",
    " showBottomSheet method is called on the Scaffold widget that the build method itself creates. If a Builder had not been used, and instead the context argument of the build method itself had been used,",
    " no Scaffold would have been found, and the Scaffold.of function would have returned null.",
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(

                    width: 350,
                    height: 200,
                    margin:EdgeInsets.all(30) ,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.5)
                    ),
                    child: Center(child: Text(quotes[_index],
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                      fontSize: 16.5,
                    ),))),
              ),
            ),
            Divider(thickness: 2.3,),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(onPressed: _showQuote,
                  color: Colors.greenAccent.shade700,
                  icon: Icon(Icons.wb_sunny),
                  label:Text("Inspire me",style:TextStyle(
                    color: Colors.white,
                    fontSize: 18.8
                  ) ,)),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index++;
      if (_index == quotes.length) {
        _index = 0;
      }
    });


  }
}


class BizCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  Text("BizCard"),
      centerTitle: true,),
          body: Container(
        alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
             _getCard(),
                _getAvatar(),
              ],
            ),

    ),
    );
  }

 Container _getCard() {
    return Container(
      width: 300,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(14.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Albin Tabara",
          style: TextStyle(fontSize: 20.9,
          fontWeight: FontWeight.w500,
          color: Colors.white,),),
          Text("fluterAplication Cours"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_outline),
              Text("albintabara@gmail.com")
            ],
          )
        ],
      ),
    );
 }

 Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(50)),
      border: Border.all(color:Colors.redAccent,width: 1.2 ),
      image: DecorationImage(image: NetworkImage("https://picsum.photos/300/300"),
      fit: BoxFit.cover,)),
    );
 }
}


class ScaffoldExemple extends StatelessWidget {
_taped(){
  debugPrint("taped bouton alarm");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALBIN scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: [
          IconButton(icon: Icon(Icons.email), onPressed:()=>debugPrint("email taped")),
        IconButton(icon: Icon(Icons.access_alarm), onPressed: _taped)],
      ),
      floatingActionButton: FloatingActionButton(onPressed:()=>debugPrint("hello called"),
      backgroundColor: Colors.lightGreen,
      child: Icon(Icons.call_missed),),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text("First")),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),title: Text("Second")),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm),title: Text("Third"))
      ],onTap: (int Index)=>debugPrint("Tapped Index: $Index"),
      ),
      backgroundColor: Colors.redAccent.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton()
        /*  InkWell(child: Text("tap me!",
          style: TextStyle(fontSize: 23.4),),
            onTap: ()=>debugPrint("tapped..."),
          )*/
        ],),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: (){
  final snackbare=SnackBar(content: Text("hello albin"),
  backgroundColor: Colors.amberAccent.shade700);
  Scaffold.of(context).showSnackBar(snackbare);
},
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text("Button albin"),
      ),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepOrange,
        child: Center(
          child: Text("hello how are you",
            textDirection:TextDirection.ltr,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 23.4,
              fontStyle: FontStyle.italic,
            ),),
        ));
  }
}