// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
