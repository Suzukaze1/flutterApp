
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Kembali'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

}