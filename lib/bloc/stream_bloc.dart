import 'dart:async';

  
class StreamBloc {

  int a=0, b=0, valueA=0, valueB=0;

  final _myStreamA = StreamController<int>();
  final _myStreamB = StreamController<int>();
  final _myStreamSum = StreamController<int>();
  
  Stream<int>  get valueAStream => _myStreamA.stream;
  Stream<int>  get valueBStream =>  _myStreamB.stream;
  Stream<int>  get sumStream => _myStreamSum.stream;


  StreamBloc(){
    initStream();
  }


  initStream(){
    a =1;
    b =2;

    Timer.periodic( const Duration(milliseconds: 1500), (clock){
      a += clock.tick;
      b += clock.tick;
      _myStreamA.sink.add(a);
      valueA = a;
      if (clock.tick%5 == 0) {
        _myStreamB.sink.add(b);
        valueB = b;
      }
      _myStreamSum.sink.add(sum(valueA, valueB));
    });
  }
   
  int sum(a, b){
      return a + b;
  }

  dispose(){
    _myStreamA.close();
    _myStreamB.close();
    _myStreamSum.close();
  }
}

final streamBloc = StreamBloc();

