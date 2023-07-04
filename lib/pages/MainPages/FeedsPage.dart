import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const FeedsPage());

class FeedsPage extends StatelessWidget{
        const FeedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Feeds'),


            ),
        
        
        ),


    );




}

}