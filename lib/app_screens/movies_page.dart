import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/widgets/toprated.dart';
import 'package:project/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../widgets/trending.dart';
import './watching_category.dart';

/// Provides the `YouTubeApi` class.
import 'package:googleapis/youtube/v3.dart';

void main() => runApp(new MoviesPage());

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.kanitTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: Colors.white, // Set the color here
          ),
          brightness: Brightness.dark,
          primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'b4983066c369fd82971b69cfe15eb880';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDk4MzA2NmMzNjlmZDgyOTcxYjY5Y2ZlMTVlYjg4MCIsInN1YiI6IjYzZjhjZjc5NDZmMzU0MDA3Y2ZhMTMyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Yjq6rzOSSLy7dHbEWZa_1Y4b4qoDLA8_73Mhb48jIL';

  @override
  void initState() {
    loadtrendingmovies();
    super.initState();
  }

  void loadtrendingmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      // appBar: AppBar(
      // backgroundColor: Colors.transparent,
      // title: Text('Flutter eiei❤️'),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                // image: AssetImage("images/bg.jpg"), fit: BoxFit.cover),
                image: NetworkImage(
                    'https://media.discordapp.net/attachments/1054322057405534228/1079129876608585849/162560-simple-background-black-background-minimalism-theater-photography-chair-stairs-dark.png?width=994&height=663'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 350),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WatchingPage()));
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            TV(
              tv: tv,
            ),
            TopRated(
              toprated: topratedmovies,
            ),
            TrendingMovies(trending: trendingmovies)
          ],
        ),
      ),
    );
  }
}
