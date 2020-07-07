import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisatabandung/detail_screen.dart';
import 'package:wisatabandung/model/tourism_place.dart';
import 'package:wisatabandung/second_screen.dart';

var informationTextStyle = TextStyle(
    fontFamily: 'Oxygen'
);

var informationTextStyleDetail = TextStyle(
    fontFamily: 'Oxygen',
    fontSize: 14.0
);

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  DetailScreen({@required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(place.imageAsset),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: (){
                            Navigator.pop(context) ;
                          },
                        ),
                        FavoriteButton(),
                      ],
                    )
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(
                        place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: informationTextStyleDetail,
              ),
            ),

            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                      child: Image.network(
                          url),
                    ),
                  );
                }).toList(),
              ),
            ),

            //Membuat Button + pindah
            /*Container(
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Pindah Screen'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SecondScreen();
                  }));
                },
              ),
            )
             */

            /*
            Container(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      child: Image.network(
                          'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                    //Done
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 20))
                  )
                ],
              ),
            )
            */

            /*
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {

              },
              child: Text(
                'Flat Button',
                style: TextStyle(fontSize: 20.0),
              ),
            )
            */
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget{
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>{
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
      ),
      onPressed: (){
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }

}

