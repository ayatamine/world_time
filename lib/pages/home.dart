import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Map data = {} ;
   String bgImage;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    bgImage = data['isDayTime'] ? 'day.png' :'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue :Colors.indigo[300];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Column(

            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  //waiting for result it may be take time
                   dynamic result = await Navigator.pushNamed(context, '/Location');
                   setState(() {
                     data = {
                       'location':result['location'],
                       'flag':result['flag'],
                       'time':result['time'],
                       'isDayTime':result['isDayTime']
                     };
                   });
                },
                  icon: Icon(Icons.edit_location,color: Colors.grey[300],),
                  label: Text('تغيير المنطقة',style: TextStyle(color:Colors.grey[300],fontSize: 18),),
                ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(data['location'],style: TextStyle(fontSize: 22,color:Colors.grey[300]))
               ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300]
                    ),
                  ),
                ],
              )

            ],
              ),
          ),
        ),
      ),
    );
  }
}
