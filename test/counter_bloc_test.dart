import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:cubit_counter/features/counter/bloc/counter_bloc.dart';

void main() {
  group('CounterBloc', () {
    CounterBloc counterBloc;

    setUp(() async {
      HydratedBloc.storage = await HydratedStorage.build();
      counterBloc = CounterBloc();
    });

    test('initial state is 0', () {
      expect(counterBloc.state, 0);
    });
  });
}
