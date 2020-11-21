import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {

  String msg;
  IconData icons;
  NoDataView({@required this.msg, @required this.icons});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(msg, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 16.0,),
            Icon(icons, color: Colors.black,)
          ],
        ),
      ),
    );
  }

}