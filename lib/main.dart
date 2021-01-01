import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/counter/counter.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => CounterCubit(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}
