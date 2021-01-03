part of 'counter_bloc.dart';

// @freezed
// abstract class CounterEvent extends ReplayEvent with _$CounterEvent {
//   const factory CounterEvent.increment() = _Increment;
//   const factory CounterEvent.decrement() = _Decrement;
// }

enum CounterEvent2Enum {
  increment,
  decrement,
}

class CounterEvent2 extends ReplayEvent {
  final CounterEvent2Enum type;
  CounterEvent2.increment() : type = CounterEvent2Enum.increment;
  CounterEvent2.decrement() : type = CounterEvent2Enum.decrement;

  @override
  String toString() {
    switch (type) {
      case CounterEvent2Enum.increment:
        return "CounterEvent2.increment";
        break;
      case CounterEvent2Enum.decrement:
        return "CounterEvent2.decrement";
        break;
      default:
        return "CounterEvent2Enum.undefined";
    }
  }
}
