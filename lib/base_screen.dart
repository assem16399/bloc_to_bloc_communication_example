import 'package:flutter/material.dart';

import 'features/feature_one/presentation/feature_one_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Base Screen'),
        ),
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FeatureOneScreen()));
              },
              child: const Text('Navigate to Feature 1'),
            ),
          ),
        ));
  }
}
