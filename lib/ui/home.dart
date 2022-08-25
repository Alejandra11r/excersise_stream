import 'dart:convert';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  final Stream<Map<String,int>> mapStream;

  const Home({Key? key, required this.mapStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: StreamBuilder(
            stream: mapStream,
            builder: (context, snapshot){
              late Map map;
              const style = TextStyle(fontSize: 20);
              if(snapshot.data != null){
                map = jsonDecode(jsonEncode(snapshot.data));
              }
              return Column(
                children: [
                  Text("Número 1 = ${snapshot.data !=null ? map['valueA'] : 0}", style: style,),
                  Text("Número 2 = ${snapshot.data !=null ? map['valueB'] : 0} ", style: style),
                  Text("Suma = ${snapshot.data !=null ? map['sum'] : 0}", style: style)
                ],
              );
            },
          ),
     ),
      ),
   );
  }
}