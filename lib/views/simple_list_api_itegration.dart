import 'package:flutter/material.dart';

class ListApi extends StatefulWidget {
  const ListApi({Key? key}) : super(key: key);

  @override
  State<ListApi> createState() => _ListApiState();
}

class _ListApiState extends State<ListApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Api'),
      ),
    );
  }
}
