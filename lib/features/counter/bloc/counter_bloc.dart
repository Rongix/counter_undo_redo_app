import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';
part 'counter_bloc.g.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>
    with ReplayBlocMixin, HydratedMixin {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield event.when(
      increment: () => CounterState(state.value + 1),
      decrement: () => CounterState(state.value - 1),
    );
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
