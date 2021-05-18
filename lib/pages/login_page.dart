import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  void submit() {
    debugPrint(_email);
    debugPrint(_password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) => _email = value!,
                    decoration: InputDecoration(
                        labelText: 'E-mail', hintText: 'youremail@mail.com'),
                  ),
                  TextFormField(
                    onSaved: (value) => _password = value!,
                    decoration: InputDecoration(
                        labelText: 'Password', hintText: 'At least 8 characters'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState!.save();
                        this.submit();
                      },
                      child: Text('Login'),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
