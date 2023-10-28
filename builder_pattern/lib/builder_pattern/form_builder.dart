import 'package:reactive_forms/reactive_forms.dart';

class FormModel {
  final String name;
  final String surname;
  final String email;
  final String password;

  FormModel(
    this.name,
    this.surname,
    this.email,
    this.password,
  );
}

abstract class IFormBuilder {
  IFormBuilder reset();
  IFormBuilder setName(String name);
  IFormBuilder setSurname(String surname);
  IFormBuilder setEmail(String email);
  IFormBuilder setPassword(String password);

  FormGroup buildForm();

  FormModel getFormModel();
}

class FormBuilderSource implements IFormBuilder {
  FormBuilderSource({FormGroup? form}) {
    this.form = form ??
        FormGroup(
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
  }

  late FormGroup form;

  @override
  IFormBuilder setEmail(String email) {
    form.control('email').value = email;
    return this;
  }

  @override
  IFormBuilder setName(String name) {
    form.control('name').value = name;
    return this;
  }

  @override
  IFormBuilder setPassword(String password) {
    form.control('password').value = password;
    return this;
  }

  @override
  IFormBuilder setSurname(String surname) {
    form.control('surname').value = surname;
    return this;
  }

  @override
  IFormBuilder reset() {
    form.reset();
    return this;
  }

  @override
  FormGroup buildForm() => form;

  @override
  FormModel getFormModel() {
    return FormModel(
      form.control('name').value,
      form.control('surname').value,
      form.control('email').value,
      form.control('password').value,
    );
  }
}
