import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';

class CounterCubit extends Cubit<int> with HydratedMixin, ReplayCubitMixin {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  int fromJson(Map<String, dynamic> json) {
    return json['value'] as int;
  }

  @override
  Map<String, dynamic> toJson(int state) {
    return {'value': state};
  }
}
