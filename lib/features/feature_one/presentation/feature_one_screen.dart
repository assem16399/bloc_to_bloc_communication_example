import 'package:bloc_to_bloc_communication_example/features/feature_one/presentation/cubit/feature_one_cubit.dart';
import 'package:bloc_to_bloc_communication_example/features/feature_two/presentation/feature_two_screen.dart';
import 'package:bloc_to_bloc_communication_example/features/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureOneScreen extends StatelessWidget {
  const FeatureOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Feature One'),
        ),
        body: SafeArea(
          child: BlocProvider<FeatureOneCubit>(
            create: (context) => mainSL<FeatureOneCubit>()..getFeatureOneData(),
            child: BlocBuilder<FeatureOneCubit, FeatureOneState>(
              builder: (context, state) {
                if (state is FeatureOneLoading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                if (state is FeatureOneError) {
                  return Center(child: Text(state.message));
                }
                if (state is FeatureOneLoaded) {
                  final featureOneData = state.data;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: featureOneData.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(featureOneData[index]),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<FeatureOneCubit>().getFeatureOneData();
                        },
                        child: const Text('Refresh'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FeatureTwoScreen()));
                        },
                        child: const Text('Navigate to Feature Two'),
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
