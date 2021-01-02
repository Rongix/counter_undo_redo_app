import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>
    with ReplayCubitMixin {
  CounterBloc() : super(CounterState.initial());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield event.when(
      increment: () => CounterState.current(state.value + 1),
      decrement: () => CounterState.current(state.value - 1),
    );
  }

  // @override
  // CounterState fromJson(Map<String, dynamic> json) {
  //   return CounterState.current(json['value'] as int);
  // }

  // @override
  // Map<String, dynamic> toJson(CounterState state) {
  //   return {'value': state};
  // }
}

@freezed
abstract class CounterEvent with _$CounterEvent {
  const factory CounterEvent.increment() = _Increment;
  const factory CounterEvent.decrement() = _Decrement;
}

@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState.initial([@Default(0) int value]) = _Initial;
  const factory CounterState.current(int value) = _Current;
}
