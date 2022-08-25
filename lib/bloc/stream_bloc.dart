import 'dart:async';

  
class StreamBloc {

  int a=0, b=0, valueA=0, valueB=0;
   Map<String,int> numbers = {
      "valueA": 0,
      "valueB": 0,
      "sum": 0
    };
  final myStreamA = StreamController();
  final myStreamB = StreamController();


  final suma = StreamController<Map<String,int>>();
  Stream<Map<String,int>>  get mapaSumaStream => suma.stream;


  StreamBloc(){
    initStream();
  }


  initStream(){
    a =1;
    b =2;

    Timer.periodic( const Duration(milliseconds: 1500), (clock){
      a += clock.tick;
      b += clock.tick;
      myStreamA.sink.add(a);
      myStreamB.sink.add(b);
    });


     myStreamA.stream.listen((event){
      valueA = event;
      numbers = {
        'valueA': valueA,
        'valueB': valueB,
        'sum': sum()
      };
      suma.sink.add(numbers);
    });
    
    myStreamB.stream.listen((event){
      valueB = event;
       numbers = {
        'valueA': valueA,
        'valueB': valueB,
        'sum': sum()
      };
      suma.sink.add(numbers);
    });
  }
   
  int sum(){
      return valueA + valueB;
  }
  
  
  
}

final streamBloc = StreamBloc();