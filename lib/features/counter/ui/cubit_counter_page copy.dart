import 'package:cubit_counter/features/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CounterDisplay(),
            // Counter controlls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IncrementButton(),
                DecrementButton(),
              ],
            ),
            // Undo / redo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UndoButton(),
                RedoButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = context.select((CounterCubit cubit) => cubit.state).toString();

    return Text(count);
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonLabel = "Increment";

    onPressed() {
      context.read<CounterCubit>().increment();
    }

    return TextButton(
      child: Text(buttonLabel),
      onPressed: onPressed,
    );
  }
}

class DecrementButton extends StatelessWidget {
  const DecrementButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonLabel = "Decrement";

    onPressed() {
      context.read<CounterCubit>().decrement();
    }

    return TextButton(
      child: Text(buttonLabel),
      onPressed: onPressed,
    );
  }
}

class UndoButton extends StatelessWidget {
  const UndoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onPressed() {
      context.read<CounterCubit>().undo();
    }

    return TextButton(
      child: Icon(Icons.undo),
      onPressed: onPressed,
    );
  }
}

class RedoButton extends StatelessWidget {
  const RedoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onPressed() {
      context.read<CounterCubit>().redo();
    }

    return TextButton(
      child: Icon(Icons.redo),
      onPressed: onPressed,
    );
  }
}
