import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String? _title, _subtitle, _thumbnail;

  BookWidget(this._title, this._subtitle, this._thumbnail);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      elevation: 8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            _thumbnail ?? "",
            height: 200,
            width: 150,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    _title ?? "-",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                  child: Text(_subtitle ?? "-",
                      maxLines: 7, overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
