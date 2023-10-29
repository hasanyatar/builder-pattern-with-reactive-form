import 'package:builder_pattern/builder_pattern/form_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormDirector {
  IFormBuilder builder;

  FormDirector(this.builder);

  FormGroup get constructForJohn => builder
      .reset()
      .setName('John')
      .setSurname('Doe')
      .setEmail('john.doe@gmail.com')
      .setPassword('12345678')
      .buildForm();

  FormGroup get constructForJane => builder
      .reset()
      .setName('Jane')
      .setSurname('Smith')
      .setEmail('jane.smith@gmail.com')
      .buildForm();

  /// ... according to your needs You can create more methods like this

  /// For example: You want to create default form for Hasan Yatar which has name, surname

  FormGroup get constructForHasan =>
      builder.reset().setName('Hasan').setSurname('Yatar').buildForm();
}

void main(List<String> args) {
  final director = FormDirector(FormBuilderSource());
  final formForJohn = director.constructForJohn;
  final formForJane = director.constructForJane;

  print(formForJohn.value);
  print(formForJane.value);
}
