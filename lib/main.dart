import 'package:exercise_stream/bloc/stream_bloc.dart';
import 'package:exercise_stream/ui/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Steam and StreamController'),
        ),
        body: Home(
          valueAStream: streamBloc.valueAStream,
          valueBStream: streamBloc.valueBStream,
          sumStream: streamBloc.sumStream
          ),
      ),
    );
  }
}