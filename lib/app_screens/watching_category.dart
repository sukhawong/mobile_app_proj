import 'package:flutter/material.dart';
import 'package:project/main.dart';
import './movies_page.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

class watchingCategory extends StatelessWidget {
  const watchingCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watching Page',
      debugShowCheckedModeBanner: false,
      home: WatchingPage(),
    );
  }
}

class WatchingPage extends StatefulWidget {
  const WatchingPage({Key? key}) : super(key: key);

  @override
  _WatchingPageState createState() => _WatchingPageState();
}

class _WatchingPageState extends State<WatchingPage> {
  List genremovies = [];
  final String apikey = 'b4983066c369fd82971b69cfe15eb880';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDk4MzA2NmMzNjlmZDgyOTcxYjY5Y2ZlMTVlYjg4MCIsInN1YiI6IjYzZjhjZjc5NDZmMzU0MDA3Y2ZhMTMyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Yjq6rzOSSLy7dHbEWZa_1Y4b4qoDLA8_73Mhb48jIL';

  void loadgenremovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map genremoviesresult = await tmdbWithCustomLogs.v3.genres.getMovieList();
    setState(() {
      genremovies = genremoviesresult['genres'];
    });
    print(genremovies);
  }

  @override
  void initState() {
    loadgenremovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF10000E),
        height: double.infinity,
        width: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: NetworkImage(
        //           'https://media.discordapp.net/attachments/1054322057405534228/1079440511309467778/old-black-background-grunge-texture-dark-wallpaper-blackboard-chalkboard-room-wall_1258-28312.png?width=1336&height=662'),
        //       fit: BoxFit.cover
        //       // image: AssetImage('images/bg.jpg'),
        //       // fit: BoxFit.cover,
        //       ),
        // ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 350),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MovieMain()));
                },
              ),
            ),
            // SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  // SizedBox(height: 10),
                  Image.asset('images/EZ.png', width: 300, height: 170),
                  // Text("EngZ",
                  //     style: TextStyle(
                  //         fontSize: 60,
                  //         fontWeight: FontWeight.w900,
                  //         color: Colors.black45)),
                  SizedBox(height: 10),
                  Text(
                    'SELECT YOUR FAVORITE GENRE',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 100),
                      ActionCategoryButton(genre: genremovies),
                      SizedBox(width: 20),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCategoryButton extends StatefulWidget {
  const ActionCategoryButton({Key? key, required List<dynamic> genre})
      : super(key: key);

  @override
  _ActionCategoryButtonState createState() => _ActionCategoryButtonState();
}

class _ActionCategoryButtonState extends State<ActionCategoryButton> {
  List genremovies = [];
  final String apikey = 'b4983066c369fd82971b69cfe15eb880';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDk4MzA2NmMzNjlmZDgyOTcxYjY5Y2ZlMTVlYjg4MCIsInN1YiI6IjYzZjhjZjc5NDZmMzU0MDA3Y2ZhMTMyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Yjq6rzOSSLy7dHbEWZa_1Y4b4qoDLA8_73Mhb48jIL';

  @override
  void initState() {
    loadgenremovies();
    super.initState();
  }

  loadgenremovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map genremoviesresult = await tmdbWithCustomLogs.v3.genres.getMovieList();
    setState(() {
      genremovies = genremoviesresult['genres'];
    });
    print(genremovies);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 548,
        // margin: const EdgeInsets.only(top:315, bottom: 315, left: 50, right: 50),
        child: ListView(children: [MoviesGenre(genre: genremovies)]));
  }
}

class MoviesGenre extends StatelessWidget {
  final List genre;

  const MoviesGenre({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: 800,
          width: 800,
          child: ListView.builder(
              itemCount: genre.length,
              itemBuilder: (context, index) {
                return Container(
                    width: 140,
                    child: Container(
                        width: 700,
                        height: 70,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black38),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        side: BorderSide(
                                          color: Color(0xFFBA9043),
                                        )))),
                            child: Text(genre[index]['name'] ?? 'Loading',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23)),
                            onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MoviesPage()))
                                })));
              }))
    ]));
  }
}
