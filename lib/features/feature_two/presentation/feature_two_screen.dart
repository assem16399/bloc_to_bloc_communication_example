import 'package:bloc_to_bloc_communication_example/features/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/feature_two_cubit.dart';

class FeatureTwoScreen extends StatelessWidget {
  const FeatureTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Feature Two'),
        ),
        body: SafeArea(
          child: BlocProvider<FeatureTwoCubit>(
            create: (context) => mainSL<FeatureTwoCubit>()..getFeatureTwoData(),
            child: BlocBuilder<FeatureTwoCubit, FeatureTwoState>(
              builder: (context, state) {
                if (state is FeatureTwoLoading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                if (state is FeatureTwoError) {
                  return Center(child: Text(state.message));
                }
                if (state is FeatureTwoLoaded) {
                  final featureTwoData = state.data;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              featureTwoData.featureTwoRelatedData.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                  featureTwoData.featureTwoRelatedData[index]),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<FeatureTwoCubit>().getFeatureTwoData();
                        },
                        child: const Text('Refresh Streamed Data'),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ));
  }
}
