import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //data = ModalRoute.of(context)!.settings.arguments as Map;
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    //data = ModalRoute.of(context).settings.arguments;
    //print(data);

    //set background
    String bg = data['isDayTime']? 'DayTime.jpg' : 'NightTime.jpg';
    Color bgColor = data['isDayTime']? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState((){
                      //data = result;
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.black,
                  ),
                  label: Text(
                    'Change Location',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),)
                  ),
                  SizedBox(height: 100.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2.0,

                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      //color: (data['isDayTime'] ? Colors.amber[800] : Colors.blueAccent),
                      color: Colors.black,
                      fontSize: 60.0,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
