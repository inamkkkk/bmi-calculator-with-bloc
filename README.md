# BMI Calculator with BLoC Pattern

This project demonstrates a BMI (Body Mass Index) calculator implemented using the Flutter framework and the BLoC (Business Logic Component) pattern for state management.

## Features

- Calculates BMI based on user-provided height and weight.
- Displays BMI category (Underweight, Normal, Overweight, Obese).
- Provides a user-friendly interface.
- Uses the BLoC pattern for clean separation of concerns and testability.

## Folder Structure


lib/
  main.dart         # Entry point of the application
  screens/
    bmi_calculator_screen.dart # UI for the BMI calculator
  bloc/
    bmi_bloc.dart    # BLoC for BMI calculation logic
    bmi_event.dart   # Events for the BMI BLoC
    bmi_state.dart   # States for the BMI BLoC
  models/
    bmi_result.dart # Data model for BMI results
  services/
    bmi_calculator.dart # Service for calculating BMI


## Dependencies

- flutter_bloc: ^8.1.3
- cupertino_icons: ^1.0.2
- intl: ^0.18.0

## Getting Started

1.  Clone the repository.
2.  Run `flutter pub get` to install dependencies.
3.  Run `flutter run` to launch the application.
