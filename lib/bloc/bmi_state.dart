import 'package:equatable/equatable.dart';
import 'package:bmi_calculator_bloc/models/bmi_result.dart';

abstract class BmiState extends Equatable {
  const BmiState();

  @override
  List<Object> get props => [];
}

class BmiInitial extends BmiState {}

class BmiLoading extends BmiState {}

class BmiCalculated extends BmiState {
  final BmiResult bmiResult;

  const BmiCalculated({required this.bmiResult});

  @override
  List<Object> get props => [bmiResult];
}

class BmiError extends BmiState {
  final String message;

  const BmiError({required this.message});

  @override
  List<Object> get props => [message];
}