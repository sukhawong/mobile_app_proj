import 'package:flutter/material.dart';
import 'package:project/config/routes.gr.dart';
import './app_screens/watching_category.dart';
import 'package:project/providers/home_provider.dart';
import 'package:project/helpers/url_strategy_helper.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

// run in terminal $flutter run -d chrome --web-renderer html

void main() {
  setUrlWithoutHashTag();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MovieMain(),
    ),
  );
}

class MovieMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.kanitTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                color: Color(0xFF10000E),
                height: double.infinity,
                width: double.infinity,
                // decoration: const BoxDecoration(
                //     // image: DecorationImage(
                //     //     image: NetworkImage(
                //     //         'https://media.discordapp.net/attachments/1054322057405534228/1079440511309467778/old-black-background-grunge-texture-dark-wallpaper-blackboard-chalkboard-room-wall_1258-28312.png?width=1336&height=662'),
                //     //     fit: BoxFit.cover)
                //     // image: AssetImage("images/bg.jpg"), fit: BoxFit.cover),
                //     ),
                child: Column(children: [
                  SizedBox(height: 100),
                  Image.asset('images/EZ.png', width: 300, height: 300),
                  // Text("EngZ",
                  //     style: TextStyle(
                  //         fontSize: 60,
                  //         fontWeight: FontWeight.w900,
                  //         color: Colors.orangeAccent)),
                  SizedBox(height: 100),
                  Text("CHOOSE YOUR WAY TO LEARN",
                      style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.w700,
                          color: Colors.white54)),
                  // Text("way of learning",
                  //     style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w700,
                  //         color: Colors.white)),
                  SizedBox(height: 35),
                  WatchingButton(),
                  SizedBox(height: 20),
                  ReadingButton(),
                ]))));
  }
}

class WatchingButton extends StatelessWidget {
  const WatchingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 50,
        // margin: const EdgeInsets.only(top:315, bottom: 315, left: 50, right: 50),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(
                          color: Color(0xFFBA9043),
                        )))),
            child: const Text("Watching",
                style: TextStyle(color: Colors.white, fontSize: 25)),
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WatchingPage()))
                }));
  }
}

class ReadingButton extends StatelessWidget {
  const ReadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 50,
        // margin: const EdgeInsets.only(top:315, bottom: 315, left: 50, right: 50),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(
                          color: Color(0xFFBA9043),
                        )))),
            child: const Text("Reading",
                style: TextStyle(color: Color(0xFFBA9043), fontSize: 25)),
            onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyApp()))
                }));
  }
}

class MyApp extends StatelessWidget {
  final _route = Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          textTheme: GoogleFonts.kanitTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      routeInformationParser: _route.defaultRouteParser(),
      routerDelegate: _route.delegate(),
    );
  }
}
