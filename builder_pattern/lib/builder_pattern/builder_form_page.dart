import 'package:builder_pattern/builder_pattern/form_builder.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BuilderFormPage extends StatefulWidget {
  const BuilderFormPage({super.key});

  @override
  State<BuilderFormPage> createState() => _FormPageState();
}

class _FormPageState extends State<BuilderFormPage> {
  late IFormBuilder formBuilder;
  final List<FormModel> formList = [];

  @override
  void initState() {
    super.initState();
    //The Builder design pattern is used as a pattern that makes building an object more flexible.
    //This pattern allows you to chain-call methods (set methods) that are used to set a set of
    //properties (or parameters) on an object. This gives you a structure that you can use to change
    //the order or number of properties and set optional properties.
    formBuilder = FormBuilderSource()
        .reset() // at first reset the form
        .setName('Hasan') // then set the name (default value)
        .setSurname('Yatar') // then set the surname (default value)
        .setEmail('abc12345@gmail.com'); // then set the email (default value)
    //.setPassword(password) // if you want to set the password, or you can skip it
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: ReactiveForm(
        formGroup: formBuilder.buildForm(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return ElevatedButton(
                          onPressed: form.valid
                              ? () => setState(() =>
                                  formList.add(formBuilder.getFormModel()))
                              : null,
                          child: const Text('Add'),
                        );
                      },
                    ),
                    // reset
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          formBuilder.reset();
                        });
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // form list
                Expanded(
                  child: ListView.builder(
                    itemCount: formList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(formList[index].name),
                        subtitle: Text(
                            '${formList[index].surname}\n${formList[index].email}'),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              formList.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
