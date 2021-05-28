class Movie{
  static List<Movie>getMovies()=>[
   Movie("avatar", "2009", "PG-13", "18 Dec 2009", "162 min", "Action,Adventure,Fantasy",
       "James cameron", "James cameron", "Sam worthing,Zoe Saldana, Sigourney Weaver",
        "tt0499","movie", "true","https://images-na.ssl-images-amazon.com/images/M",
       ["https://images-na.ssl-images-amazon.com/images/M",
         "https://images-na.ssl-images-amazon.com/images/M",
         "https://images-na.ssl-images-amazon.com/images/M",
         "https://images-na.ssl-images-amazon.com/images/M",
         "https://images-na.ssl-images-amazon.com/images/M",]),
    Movie("Game of Thrones", "2008", "PG-13", "May 19, 2019", "162 min", "Action,Adventure,Fantasy",
        "Dave Hill", "David Nutter", "Peter Dinklage ,Nikolaj Coster-Waldau, Lena Headey,Emilia Clarke ",
        "tt0499","movie", "true","Image.network('https://picsum.photos/250?image=9')",
        ["https://www.oerlive.com/wp-content/uploads/2019/04/jonsnowonthronegot.jpg",
          "https://upload.wikimedia.org/wikipedia/en/e/e0/Game_of_Thrones_Season_8.png",
          "https://upload.wikimedia.org/wikipedia/en/e/e0/Game_of_Thrones_Season_8.png",
          "https://www.amazon.fr/images/I/51HHNbdB6HL._AC_.jpg",
          "https://www.amazon.fr/images/I/51HHNbdB6HL._AC_.jpg",]),
    Movie("The Avengers ", "2004", "PG-13", "18 Dec 2009", "162 min", "Action,Adventure,Fantasy",
        "James cameron", "James cameron", "Sam worthing,Zoe Saldana, Sigourney Weaver",
        "tt0499","movie", "true","https://images-na.ssl-images-amazon.com/images/M",
        ["https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",]),
    Movie("Vikings", "2017", "PG-13", "18 Dec 2009", "162 min", "Action,Adventure,Fantasy",
        "James cameron", "James cameron", "Sam worthing,Zoe Saldana, Sigourney Weaver",
        "tt0499","movie", "true","https://images-na.ssl-images-amazon.com/images/M",
        ["https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",]),
    Movie("Dead pool", "2016", "PG-13", "18 Dec 2009", "162 min", "Action,Adventure,Fantasy",
        "James cameron", "James cameron", "Sam worthing,Zoe Saldana, Sigourney Weaver",
        "tt0499","movie", "true","https://images-na.ssl-images-amazon.com/images/M",
        ["https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",]),
    Movie("Spider man", "2018", "PG-13", "18 Dec 2009", "162 min", "Action,Adventure,Fantasy",
        "James cameron", "James cameron", "Sam worthing,Zoe Saldana, Sigourney Weaver",
        "tt0499","movie", "true","https://images-na.ssl-images-amazon.com/images/M",
        ["https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",
          "https://images-na.ssl-images-amazon.com/images/M",]),
  ];

  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String imdbVotes;
  String type;
  String response;
  String poster;
  List<String> images;
  Movie(this.title,this.year,this.rated,this.released,this.runtime,this.genre,this.director,this.writer,
      this.actors,this.imdbVotes, this.type,this.response,this.poster,this.images);
}