


import 'package:albinflutter/model/movie.dart';
import 'package:flutter/material.dart';

class MovieListViewDetail extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieListViewDetail({Key key,this.movieName,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.poster,),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie,),
          HorizontalLine(),
          MovieDetailsExtraPoster(posters: movie.images,)
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text("Go Back${this.movie.director}"),
      //       onPressed: (){
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({Key key,this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height:130,
              decoration: BoxDecoration(
                color:Colors.black38,
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),

            ),
            Icon(Icons.play_circle_outline,size: 80,
              // color: Colors.yellow,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,)
          ),
          height: 80,
        ),
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster(poster:movie.images[0].toString(),),
          SizedBox(width: 12,),
          Expanded(child: MovieDetailsHeader(movie:movie))
        ],
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.year}. ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.cyan,
          ),),
        Text(movie.title,style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: ("albin ${movie.title} ${movie.director} ${movie.actors} ${movie.type} ${movie.genre} ")
              ),
              TextSpan(
                  text: "More....",style: TextStyle(
                color: Colors.indigoAccent,
              )
              )
            ]
        ))
      ],
    );
  }
}
class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value:movie.actors),
          MovieField(field: "Director",value:movie.director),
          MovieField(field: "Writer",value: movie.writer,)
        ],
      ),
    );
  }
}
class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key key,this.value,this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field",style: TextStyle(
          color: Colors.black38,
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
        ),),
        Expanded(
          child: Text("$value",style: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
          ),),
        )
      ],
    );
  }
}


class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key key,this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius=BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width /4,
          height: 120,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(poster),
                  fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPoster extends StatelessWidget {
  final List<String> posters;
  const MovieDetailsExtraPoster({Key key,this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:8.0,bottom: 8.0),
          child:   Text("More Movie Posters".toUpperCase(),

            style: TextStyle(

              fontSize: 10,

              color: Colors.black,

            ),),
        ),
        Container(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            separatorBuilder: (context,index)=>SizedBox(width: 8.0,),
            itemCount: posters.length,
            itemBuilder: (context,index)=>ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                        fit: BoxFit.cover)
                ),

              ),
            ),),
        )
      ],
    );
  }
}


