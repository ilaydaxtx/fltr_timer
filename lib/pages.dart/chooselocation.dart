import 'package:flutter/material.dart';
import 'package:worldtime/services.dart/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png', isDaytime: true),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greek.png', isDaytime: true),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', isDaytime: true),
    WorldTime(url: 'Turkey/Istanbul', location: 'Istanbul', flag: 'tr.png', isDaytime: true),
    WorldTime(url: 'South Korea/Seoul', location: 'Seoul', flag: 'korea.png', isDaytime: true),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Text("choose a location"),
        centerTitle: true,
      ),
      body:

      ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
