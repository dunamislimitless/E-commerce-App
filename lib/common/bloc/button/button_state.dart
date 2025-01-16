abstract class ButtonStateC {}

class ButtonInitialState extends ButtonStateC {}

class ButtonLoadingState extends ButtonStateC {}

class ButtonSuccessState extends ButtonStateC {}

class ButtonFailureState extends ButtonStateC {
  final String errorMessage;
  ButtonFailureState({required this.errorMessage});
}
