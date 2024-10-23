
import 'package:e_commerce_app/app/extensions/extension.dart';

mixin validators {
  String? validateEmail(String? value) {
    if (!value!.isValidEmail()) {
      return "Enter a valid email address";
    }
    return null;
  }
}
