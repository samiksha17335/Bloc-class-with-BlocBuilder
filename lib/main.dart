import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise_for_av/bloc/bloc.dart';
import 'package:flutter_practise_for_av/bloc/counter_event.dart';
import 'package:flutter_practise_for_av/bloc/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final counterplusBloc=CounterBloc();
// final counterminusBloc=CounterDecrementEvent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc,CounterState>(
              buildWhen: (previous,current){
                previous.count;
                current.count;
                return true;

              },
              bloc: counterplusBloc,
                builder: (context,state){
            return Text(
              state.count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
                })
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          FloatingActionButton(
          onPressed: (){
             counterplusBloc.add(CounterIncrementEvent());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
    FloatingActionButton(
    onPressed: (){
    counterplusBloc.add(CounterDecrementEvent());
    },
    tooltip: 'decrement',
    child: const Icon(Icons.minimize),
    ),

    ] )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
