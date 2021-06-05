
import 'dart:ffi';

import 'package:albinflutter/model/movie.dart';
import 'package:albinflutter/model/question.dart';
import 'package:albinflutter/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_ui/movie_ui.dart';

class MoviesListView extends StatefulWidget {



  @override
  _MoviesListViewState createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  final List<Movie>movieList= Movie.getMovies();
  final List movies=[
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies Albin"),
      backgroundColor:Colors.blueGrey.shade900,
      ),
      backgroundColor:Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context,int index){
            return Stack(children:[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10.0,
                  child: movieImage(movieList[index].poster)),
             ]);
        // return Card(
        //   elevation: 4.5,
        //   color: Colors.white,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //           image: DecorationImage(
        //             image: NetworkImage(movieList[index].poster),
        //           ),
        //           borderRadius: BorderRadius.circular(13.9),
        //         ),
        //         child:Text("H"),
        //
        //       ),
        //     ),
        //     trailing: Text("..."),
        //     title: Text(movieList.elementAt(index).title),
        //     subtitle: Text("${movieList[index].year}"),
        //     //onTap: ()=>debugPrint("Movie name ${movies.elementAt(index)}"),
        //    onTap: (){
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieListViewDetail(movieName: movieList.elementAt(index).title,
        //       movie: movieList[index],)));
        //    },
        //   ),
        //
        // );
      }),
    );
  }
  Widget movieCard(Movie movie,BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(
          left: 40,
        ),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,
              bottom: 8.0,
              left: 54.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Flexible(
                        child: Text(movie.title,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.5,
                          color: Colors.white,
                        ),),
                      ),
                      Text("Rated: ${movie.rated} /10",style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12.5,
                      ),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Text("Realased: ${movie.year}",style:mainTextStyle(),),
                      Text(movie.runtime,style:mainTextStyle(),),
                      Text(movie.type,style: mainTextStyle(),)
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieListViewDetail(movieName: movie.title,
          movie: movie,)));
       },
    );
  }
  TextStyle mainTextStyle(){
    return TextStyle(
      color: Colors.white70,
      fontSize: 12.5,
    );
  }
  Widget movieImage(String imageUrl){

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow,
        image: DecorationImage(
          image: NetworkImage(imageUrl),

          fit: BoxFit.cover,
        )
      ),
    );
  }
}



class QuizApp extends StatefulWidget {

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex=0;
  List questionBank=[
    Question.name("Albin is it a girl?", false),
    Question.name("Albin have 20 year old", false),
    Question.name("Albin love programming? ", true),
    Question.name("Albin was married? ", false),
    Question.name("Albin take 6 hour to learn programming? ", true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Albin Tabara"),
    centerTitle: true,
  //  backgroundColor: Colors.blueGrey,
    ),
    //  backgroundColor: Colors.blueGrey,
    body: Builder(
      builder:(BuildContext context) =>Container(
        child:Column (
          mainAxisAlignment: MainAxisAlignment.center,
children: [
  Center(
      child: Image.asset("images/albin.png",
      width: 200,
      height: 200,),
  ),
  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: Colors.grey.shade700,style: BorderStyle.solid,
          )
        ),
        height: 100.0,
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(questionBank[_currentQuestionIndex].questionText,
            // style: TextStyle(color: Colors.white, fontSize: 16.9,),
            ),
        )),
      ),
  ),
  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [

        SizedBox(
          width: 60,
          child: RaisedButton(onPressed: ()=> _nextQuestion(),
            color: Colors.blueGrey.shade900,
            child: Icon(Icons.arrow_back,color: Colors.white,),),
        ),
RaisedButton(onPressed: ()=> _checkAnswer(true,context),
   color: Colors.blueGrey.shade900,
child: Text("TRUE",style: TextStyle(color: Colors.white,)),),

        ElevatedButton(onPressed: ()=> _checkAnswer(false,context),
      //color: Colors.blueGrey.shade900,

          child: Text("FALSE",style: TextStyle(color: Colors.white,),),
        ),

        SizedBox(
          width: 60,
          child: RaisedButton(onPressed: ()=> _previewQuestion(),
            color: Colors.blueGrey.shade900,


            child: Icon(Icons.arrow_forward,color: Colors.white,),),
        ),

      ],
  ),
  Spacer(),
],
        ),
      ),
    ),);
  }
  _checkAnswer(bool userChoice,BuildContext context){
if(userChoice==questionBank[_currentQuestionIndex].isCorrect){
  final snackbare=SnackBar(content: Text("Yes is correct"),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.lightBlueAccent.shade700);
  Scaffold.of(context).showSnackBar(snackbare);
  _updateQuestion();
}else{
  debugPrint("incorrect");
  final snackbare=SnackBar(content: Text("incorrect"),
      duration: Duration(milliseconds: 500),
      backgroundColor: Colors.redAccent.shade700);
  Scaffold.of(context).showSnackBar(snackbare);
  _updateQuestion();
}
  }
_updateQuestion(){
  setState(() {
    _currentQuestionIndex=(_currentQuestionIndex+1)%questionBank.length;

  });
}
  _nextQuestion() {
   _updateQuestion();

  }

  _previewQuestion() {
    setState(() {
      _currentQuestionIndex=(_currentQuestionIndex-1)%questionBank.length;

    });
  }
}


class BillSplitter extends StatefulWidget {

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPersentage=0;
  int _personCounter=0;
  double _billAmount=0.0;
  Color _purpet=HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color:_purpet.withOpacity(0.1), //Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total per Person",style: TextStyle(
                  color: _purpet,
                  fontWeight: FontWeight.normal,
                  fontSize: 17.0,
                ),),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("\$ ${calculateTotalPerson(_billAmount, _personCounter, _tipPersentage)}",style: TextStyle(
                        color: _purpet,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0,
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                  borderRadius: BorderRadius.circular(12.0),

              ),
              child: Column(
                children: [
TextField(
  keyboardType: TextInputType.numberWithOptions(decimal: true),
  style: TextStyle(color:_purpet),
  decoration: InputDecoration(
    prefixText: "Bill Amount ",
    prefixIcon: Icon(Icons.attach_money),

  ),
  onChanged: (String value){
    try{
      _billAmount=double.parse(value);
    }catch(exception){
      _billAmount=0.0;
    }
  },
),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",style: TextStyle(
                        color: Colors.grey.shade700,

                      ),),
                      Row(children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              if(_personCounter>1){
                                _personCounter--;
                              }
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color:_purpet.withOpacity(0.1),
                            ),
                            child: Center(
                              child: Text(
                                "-",style: TextStyle(
                                color: _purpet,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,

                              ),
                              ),
                            ),
                          ),
                        ),
                        Text("$_personCounter", style: TextStyle(
                          color: _purpet,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),),
                        InkWell(
                          onTap: (){
                            setState(() {
                              _personCounter++;
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color:_purpet.withOpacity(0.1),
                            ),
                            child: Center(
                              child: Text(
                                "+",style: TextStyle(
                                color: _purpet,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,

                              ),
                              ),
                            ),
                          ),
                        ),

                      ],)
                    ],
                  ), Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip",style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("\$ ${(calculateTotalTip(_billAmount,_personCounter,_tipPersentage)).toStringAsFixed(2)}",style: TextStyle(
                          color: _purpet,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("$_tipPersentage%",style: TextStyle(
                    color: _purpet,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),),
                      Slider(
                        min: 0,
                          max:100,
                          activeColor: _purpet,
                          inactiveColor: Colors.grey,
                          divisions: 10,

                          value: _tipPersentage.toDouble(),
                          onChanged:(double newValue){
                        setState(() {
                          _tipPersentage=newValue.round();
                        });

                          })
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  calculateTotalPerson(double billAmount, int splitBy,int tipPercentage ){
 var totalPerPerson=(calculateTotalTip(billAmount, splitBy, tipPercentage)+billAmount)/splitBy;
 return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
double totalTip=0.0;
if(billAmount<0||billAmount.toString().isEmpty||billAmount==null){

}else{
  totalTip=(billAmount*tipPercentage)/100;
}
return totalTip;
  }
}


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
      image: DecorationImage(image: NetworkImage("https://www.facebook.com/photo.php?fbid=2811276322462225&set=t.100007396543211&type=3"),
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