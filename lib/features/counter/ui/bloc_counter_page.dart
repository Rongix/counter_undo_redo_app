import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_counter/features/counter/bloc/counter_bloc.dart';

class BlocCounterPage extends StatelessWidget {
  const BlocCounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocCounterDisplay(),
            // Counter controlls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocIncrementButton(),
                BlocDecrementButton(),
              ],
            ),
            // Undo / redo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocUndoButton(),
                BlocRedoButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BlocCounterDisplay extends StatelessWidget {
  const BlocCounterDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) => Text(state.value.toString()));
  }
}

class BlocIncrementButton extends StatelessWidget {
  const BlocIncrementButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonLabel = "Increment";

    onPressed() {
      BlocProvider.of<CounterBloc>(context).add(CounterEvent.increment());
    }

    return TextButton(
      child: Text(buttonLabel),
      onPressed: onPressed,
    );
  }
}

class BlocDecrementButton extends StatelessWidget {
  const BlocDecrementButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonLabel = "Decrement";

    onPressed() {
      BlocProvider.of<CounterBloc>(context).add(CounterEvent.decrement());
    }

    return TextButton(
      child: Text(buttonLabel),
      onPressed: onPressed,
    );
  }
}

class BlocUndoButton extends StatelessWidget {
  const BlocUndoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onPressed() {
      BlocProvider.of<CounterBloc>(context).undo();
    }

    return TextButton(
      child: Icon(Icons.undo),
      onPressed: onPressed,
    );
  }
}

class BlocRedoButton extends StatelessWidget {
  const BlocRedoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onPressed() {
      BlocProvider.of<CounterBloc>(context).redo();
    }

    return TextButton(
      child: Icon(Icons.redo),
      onPressed: onPressed,
    );
  }
}
