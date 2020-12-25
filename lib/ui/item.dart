import 'package:coderbot/models/responses.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {

  Responses datos;
  Item({this.datos});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return this.datos.index == 0 ? Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(12.0),
          width: size.width*0.70,
          child: Html(
            data: this.datos.txt,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kElevationToShadow[2],
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
          )
        )
      ]
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(12.0),
          width: size.width*0.70,
          child: Text(this.datos.txt, style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: kElevationToShadow[2],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
          )
        )
      ]
    );
  }
}
