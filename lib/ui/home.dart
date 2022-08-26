import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  final Stream<int> valueAStream;
  final Stream<int> valueBStream;
  final Stream<int> sumStream;

  const Home({Key? key, required this.valueAStream, required this.valueBStream, required this.sumStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              StreamBuilder(
                stream: valueAStream,
                builder: (context, AsyncSnapshot<int> snapshot){
                  return Text(
                    "Número 1 = ${snapshot.data ?? 0}", 
                    style: style
                  );
                },
              ),
              StreamBuilder(
                stream: valueBStream,
                builder: (context, AsyncSnapshot<int> snapshot){
                  return Text("Número 2 = ${snapshot.data ?? 0}", style: style,);
                },
              ),
              StreamBuilder(
                stream: sumStream,
                builder: (context, AsyncSnapshot<int> snapshot){
                  // print(snapshot.data);
                  return Text("Suma = ${snapshot.data ?? 0}", style: style,);
                },
              ),
            ],
          )
     ),
      ),
   );
  }
}