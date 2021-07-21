import 'package:flutter/material.dart';
import 'package:flutter_sanctum/models/message_result.dart';
import 'package:flutter_sanctum/models/user_model.dart';
import 'package:flutter_sanctum/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // final user = UserModel();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  Future<void> submit(BuildContext context) async{
    var result = Provider.of<Auth>(context, listen: false);
    var response = await result.login(
      UserModel(username: _usernameCtrl.text, password: _passwordCtrl.text)
    );
    if(response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message),
        backgroundColor: Colors.green,));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message),
        backgroundColor: Colors.red,));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
        elevation: 0,
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
                    // initialValue: 'rui',
                    controller: _usernameCtrl,
                    onSaved: (value) => _usernameCtrl.text = value!,
                    validator: (value) => value!.isEmpty ? 'Fill the field': null,
                    decoration: InputDecoration(
                        labelText: 'E-mail', hintText: 'youremail@mail.com'),
                  ),
                  TextFormField(
                    // initialValue: 'love1912',
                    controller: _passwordCtrl,
                    onSaved: (value) => _passwordCtrl.text = value!,
                    validator: (value) => value!.isEmpty ? 'Fill the field': null,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'At least 8 characters'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(12),
                          ),
                          textStyle: MaterialStateProperty.all(
                            TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                          this.submit(context);
                          _formKey.currentState!.save();
                        }
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
