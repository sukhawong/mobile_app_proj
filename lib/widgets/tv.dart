import 'package:flutter/material.dart';

import '../app_screens/description.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coming soon...',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Color(0xFFBA9043)),
          ),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                        name: tv[index]['title'],
                                        bannerurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                tv[index]['backdrop_path'],
                                        description: tv[index]['overview'],
                                        posterurl:
                                            'https://image.tmdb.org/t/p/w500' +
                                                tv[index]['poster_path'],
                                        vote: '',
                                        launch_on: tv[index]['release_date'],
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          // color: Colors.green,
                          width: 250,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path']),
                                      fit: BoxFit.cover),
                                ),
                                height: 140,
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 18,
                                child: Text(
                                  tv[index]['title'] != null
                                      ? tv[index]['title']
                                      : tv[index]['name'],
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ));
                  }))
        ],
      ),
    );
  }
}
