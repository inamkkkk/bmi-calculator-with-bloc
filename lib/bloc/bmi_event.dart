import 'package:equatable/equatable.dart';

abstract class BmiEvent extends Equatable {
  const BmiEvent();

  @override
  List<Object> get props => [];
}

class CalculateBmiEvent extends BmiEvent {
  final double height;
  final double weight;

  const CalculateBmiEvent({required this.height, required this.weight});

  @override
  List<Object> get props => [height, weight];
}