import 'dart:convert';

class CounterState {
  int count;
   bool? wasIncremented;
  CounterState({required this.count, this.wasIncremented});

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'wasIncremented': wasIncremented,
    };
  }

 factory CounterState.fromMap(Map <String,dynamic> map )=> CounterState(
       count: map['count'],
       wasIncremented: map['wasIncremented']);
 

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>  CounterState.fromMap(json.decode(source));
  
}
