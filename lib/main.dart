import 'package:cubit_counter/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'features/counter/counter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => CounterCubit()),
    BlocProvider(create: (_) => CounterBloc()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalLightTheme,
      darkTheme: globalDarkTheme,
      debugShowCheckedModeBanner: false,
      home: BlocCounterPage(),
    );
  }
}
