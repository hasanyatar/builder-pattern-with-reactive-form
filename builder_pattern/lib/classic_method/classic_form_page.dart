import 'package:builder_pattern/classic_method/classic_method.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ClassicMethodFormPage extends StatefulWidget {
  const ClassicMethodFormPage({super.key});

  @override
  State<ClassicMethodFormPage> createState() => _FormPageState();
}

class _FormPageState extends State<ClassicMethodFormPage> {
  final classicForm = ClassicFormMethod();

  @override
  void initState() {
    super.initState();
    //
    classicForm.setForm('Hasan', 'Yatar', 'abc123@gmail.com', '3232132134');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: ReactiveForm(
        formGroup: classicForm.form,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                // name
                ReactiveTextField(
                  formControlName: 'name',
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 16),
                // surname
                ReactiveTextField(
                  formControlName: 'surname',
                  decoration: const InputDecoration(
                    labelText: 'Surname',
                    hintText: 'Enter your surname',
                  ),
                ),
                const SizedBox(height: 16),
                // email
                ReactiveTextField(
                  formControlName: 'email',
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 16),
                // password
                ReactiveTextField(
                  formControlName: 'password',
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 16),
                // submit button
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return ElevatedButton(
                      onPressed: form.valid
                          ? () {
                              classicForm.dispose();
                              Navigator.pop(context);
                            }
                          : null,
                      child: const Text('Submit'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
