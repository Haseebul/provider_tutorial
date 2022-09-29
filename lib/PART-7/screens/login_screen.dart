import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   // final authProvider = Provider.of<AuthProvider>(context);
    print("build");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 20),
            Consumer<AuthProvider>(builder: (context,value,child){
              return InkWell(
                onTap: (){
                  value.login(emailController.text.toString(), passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child:
                    value.loading ? const CircularProgressIndicator():
                    Text('Login'),),
                ),
              );
            }),
            // InkWell(
            //   onTap: (){
            //     authProvider.login(emailController.text.toString(), passwordController.text.toString());
            //   },
            //   child: Container(
            //     height: 50,
            //     decoration: BoxDecoration(
            //         color: Colors.green,
            //         borderRadius: BorderRadius.circular(10)
            //     ),
            //     child: Center(
            //       child:
            //       authProvider.loading ? const CircularProgressIndicator():
            //       Text('Login'),),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
