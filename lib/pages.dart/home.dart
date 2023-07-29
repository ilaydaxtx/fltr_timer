import 'package:flutter/material.dart';
import 'package:worldtime/services.dart/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}): super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {

  };
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    String bgimage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color? bgcolor =  data['isDaytime'] ? Colors.blue[200] : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text("edit location",
                    style: TextStyle(
                      color: Colors.purple[200],
                    ),),
                ),
                SizedBox(height: 50.0),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text(data['location'],
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 58.0,
                        letterSpacing: 2.0,

                      ),
                    )
                  ],
                ),

                Divider(thickness: 3.0,
                color: Colors.pink[100],),
                Text(
                    data['time'],
                  style: TextStyle(
                    color: Colors.pink[200],
                    fontSize: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ),
    ),
    );
  }
}
