import 'package:flutter/material.dart';

void main() => runApp(ReadingPage());

class ReadingPage extends StatelessWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://media.discordapp.net/attachments/1054322057405534228/1079129876608585849/162560-simple-background-black-background-minimalism-theater-photography-chair-stairs-dark.png?width=994&height=663'), fit: BoxFit.cover
                      // image: AssetImage("images/alan.jpg"), fit: BoxFit.cover),
                )),
                child: Column(
                  children: [
                    IconButton(
                        padding: EdgeInsets.only(top: 40, right: 310),
                        iconSize: 35,
                        icon:
                            Icon(Icons.arrow_back_ios_new, color: Colors.white54),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    SizedBox(height: 350),
                    Text('Page in progress!',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white))
                  ],
                ))));
  }
}
