import 'package:e_commerce_app/app/extensions/extension.dart';

mixin Validators {
  String? validateEmail(String? value) {
    if (!value!.isValidEmail()) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!value.isValidatePassword()) {
      return 'Password must contain at least:\n'
          '- One uppercase letter\n'
          '- One lowercase letter\n';
    }
    return null;
  }
}
