import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/count_provider.dart';

class CounterExpample extends StatefulWidget {
  const CounterExpample({Key? key}) : super(key: key);

  @override
  State<CounterExpample> createState() => _CounterExpampleState();
}

class _CounterExpampleState extends State<CounterExpample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 0), (timer) {
      countProvider.setcounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBAr'),
      ),
      body: Column(
        children: [
          Consumer<CountProvider>(builder: (context, value, child) {
            print('buildsssss');
            return Center(
              child: Text('${value.count}'),
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setcounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
