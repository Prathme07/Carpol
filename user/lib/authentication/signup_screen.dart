import 'package:flutter/material.dart';
import 'package:user/authentication/login_scren.dart';
import 'package:user/methods/common_method.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key); // Fixed super call

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usertextEditingController = TextEditingController();
  TextEditingController userPhoneEditingController = TextEditingController(); 
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  CommonMethods cMethod = CommonMethods();

  void checkIfNetworkIsAvailable() { // Added void return type
    cMethod.checkConnectivity(context);

    void signUpForValidation() { // Added void return type
      if (usertextEditingController.text.trim().length < 4) { // Fixed typo: 'lenght' to 'length'
        cMethod.displaySnackBar(
            "Your Name must be at least 4 or more characters.", context); // Fixed typo: 'lenght' to 'length'
      } else if (userPhoneEditingController.text.trim().length >= 11) { // Fixed typo: 'lenght' to 'length'
        cMethod.displaySnackBar("Your Number must be 10 digits.", context); // Fixed typo: 'lenght' to 'length'
      } else if (!emailtextEditingController.text.contains("@")) { // Fixed email validation condition
        cMethod.displaySnackBar("Please write a valid email.", context); // Fixed typo: 'valid email' to 'a valid email'
      } else if (passwordtextEditingController.text.trim().length < 6) { // Changed length to be consistent with the message
        cMethod.displaySnackBar(
            "Password must have at least 6 or more characters", context); // Fixed typo: 'lenght' to 'length'
      } else {
        // register the user
      }
    }

    signUpForValidation(); // Call signUpForValidation function
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              const SizedBox(height: 20), // Added SizedBox for spacing
              const Text(
                "Create a User's Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    TextField(
                      controller: usertextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: emailtextEditingController,
                      keyboardType: TextInputType.emailAddress,
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
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: userPhoneEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "User Number",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
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
                        checkIfNetworkIsAvailable();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // Fixed deprecated property
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 10),
                      ),
                      child: const Text("Sign Up"),
                    ),
                    const SizedBox(height: 12), // Added SizedBox for spacing
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => LoginScreen()));
                      },
                      child: const Text(
                        "Already have an Account? Login Here",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
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
