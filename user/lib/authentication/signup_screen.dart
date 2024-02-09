import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usertextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              const Text(
                "Create a User\'s Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
               Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [TextField(
                      controller:usertextEditingController, keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                          
                      ),
                      style:const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22,),


                    TextField(
                      controller: emailtextEditingController, keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "User Email",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                          
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22,),


                    TextField(
                      controller: passwordtextEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 22),
                    ElevatedButton(
                      onPressed: () {
                        // Implement your logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // Fixed deprecated property
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      ),
                      child: const Text("Sign Up"),
                  ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
