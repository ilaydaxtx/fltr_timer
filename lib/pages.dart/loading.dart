import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services.dart/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}): super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin', isDaytime: true);
    try {
      await instance.getTime();
      setState(() {
        time = instance.time;
      });
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,

      });
    } catch (error) {
      print('Error fetching time: $error');
      setState(() {
        time = 'Error fetching time';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: SpinKitPumpingHeart(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
