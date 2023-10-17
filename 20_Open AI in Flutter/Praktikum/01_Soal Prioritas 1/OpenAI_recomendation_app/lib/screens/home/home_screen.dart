import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:openai_recomendation_app/bloc/phone_recomendation/phone_recomendation_cubit.dart';
import 'package:openai_recomendation_app/bloc/phone_recomendation/phone_recomendation_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final budgetController = TextEditingController();
  final storageController = TextEditingController();
  final cameraController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recomendation Generator"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: budgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text("Budget (IDR)")),
              ),
              TextField(
                controller: storageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text("Storage (GB)")),
              ),
              TextField(
                controller: cameraController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text("Camera (MP)")),
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () => context
                    .read<PhoneRecomendationCubit>()
                    .getPhoneRecomendation(
                      budget: budgetController.text,
                      camera: cameraController.text,
                      storage: storageController.text,
                    ),
                child: const Text("Generate"),
              ),
              const SizedBox(height: 16),
              BlocBuilder<PhoneRecomendationCubit, PhoneRecomendationState>(
                builder: (context, state) {
                  if (state is PhoneRecomendationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is PhoneRecomendationSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Result",
                          style: TextStyle(fontSize: 28),
                        ),
                        const SizedBox(height: 8),
                        Text(state.result),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
