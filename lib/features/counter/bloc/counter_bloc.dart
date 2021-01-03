import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';
part 'counter_bloc.g.dart';

class CounterBloc extends Bloc<CounterEvent2, CounterState>
    with ReplayBlocMixin, HydratedMixin {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent2 event,
  ) async* {
    switch (event.type) {
      case CounterEvent2Enum.increment:
        yield CounterState(state.value + 1);
        break;
      case CounterEvent2Enum.decrement:
        yield CounterState(state.value - 1);
        break;
    }
  }

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toJson();
  }
}
