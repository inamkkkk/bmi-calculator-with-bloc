import 'package:bloc/bloc.dart';
import 'package:bmi_calculator_bloc/bloc/bmi_event.dart';
import 'package:bmi_calculator_bloc/bloc/bmi_state.dart';
import 'package:bmi_calculator_bloc/models/bmi_result.dart';
import 'package:bmi_calculator_bloc/services/bmi_calculator.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiInitial()) {
    on<CalculateBmiEvent>(_onCalculateBmi);
  }

  void _onCalculateBmi(CalculateBmiEvent event, Emitter<BmiState> emit) async {
    emit(BmiLoading());
    try {
      final bmi = calculateBMI(event.height / 100, event.weight); // Convert cm to meters
      final category = getCategory(bmi);
      final bmiResult = BmiResult(
        bmi: bmi,
        category: category,
        timestamp: DateTime.now(),
      );
      emit(BmiCalculated(bmiResult: bmiResult));
    } catch (e) {
      emit(BmiError(message: 'Failed to calculate BMI: ${e.toString()}'));
    }
  }
}