import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_calculator_bloc/bloc/bmi_bloc.dart';
import 'package:intl/intl.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(labelText: 'Height (cm)'),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final height = double.tryParse(_heightController.text);
                final weight = double.tryParse(_weightController.text);
                if (height != null && weight != null) {
                  context.read<BmiBloc>().add(CalculateBmiEvent(height: height, weight: weight));
                }
              },
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<BmiBloc, BmiState>(
              builder: (context, state) {
                if (state is BmiLoading) {
                  return const CircularProgressIndicator();
                } else if (state is BmiCalculated) {
                  return Column(
                    children: [
                      Text('BMI: ${state.bmiResult.bmi.toStringAsFixed(2)}'),
                      Text('Category: ${state.bmiResult.category}'),
                      Text('Last Calculated: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(state.bmiResult.timestamp)}'),
                    ],
                  );
                } else if (state is BmiError) {
                  return Text('Error: ${state.message}');
                } else {
                  return const Text('Enter height and weight to calculate BMI.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}