import 'package:flutter/material.dart';

void main() {
  runApp(const FavoriteWidget());
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({ Key? key }) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite(){
    setState(
      (){
        if(_isFavorited){
          _favoriteCount -=1;
          _isFavorited = false;
        }else{
          _favoriteCount +=1;
          _isFavorited = true;
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE')
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'image/lakes.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey.shade500),)
                      ],
                    ),
                  ),
                  IconButton(
                      icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
                      onPressed: _toggleFavorite,
                      color: Colors.red.shade500,
                    ),
                  Text('$_favoriteCount')
                ],
              )
            ),
            buttonSection,
            textSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label){
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: EdgeInsets.only(top:8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

Widget textSection = Padding(
  padding: EdgeInsets.all(32),
  child:Text(    
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);