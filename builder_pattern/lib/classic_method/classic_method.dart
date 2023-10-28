import 'package:reactive_forms/reactive_forms.dart';

class ClassicFormMethod {
  FormGroup form = FormGroup(
    {
      'name': FormControl<String>(
        validators: [Validators.required],
      ),
      'surname': FormControl<String>(
        validators: [Validators.required],
      ),
      'email': FormControl<String>(
          validators: [Validators.required, Validators.email]),
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
    },
  );

  void setForm(
    String name,
    String surname,
    String email,
    String password,
  ) {
    form.reset(
      value: {
        'name': name,
        'surname': surname,
        'email': email,
        'password': password,
      },
    );
  }

  void dispose() {
    form.dispose();
  }
}
