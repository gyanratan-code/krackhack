import 'package:flutter/material.dart';
import 'package:iit_marketing/services/auth_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // App Name
                const Text(
                  "News Of All",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),

                const SizedBox(height: 10),

                // Subtitle
                const Text("Log in to your account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const Text("Enter your email to log in", style: TextStyle(fontSize: 14, color: Colors.grey)),

                const SizedBox(height: 20),

                // Form
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Email Input
                      TextFormField(
                        validator: (value) => value == null || value.isEmpty ? "Email cannot be empty" : null,
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: "Institute Email ID",
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Password Input
                      TextFormField(
                        validator: (value) => value == null || value.length < 8 ? "Password should have at least 8 characters" : null,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: "Password",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // Forgot Password?
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Add forgot password functionality
                    },
                    child: const Text("Forgot Password?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                ),

                const SizedBox(height: 10),

                // Continue Button (Login)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print("🔹 Trying to log in with: ${_emailController.text}");

                        String result = await AuthService().loginWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text
                        );

                        if (result == "Login successful") {
                          print("✅ Logged in successfully!");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Logged in successfully")),
                          );
                          Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
                        } else {
                          print("❌ Error: $result");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result), backgroundColor: Colors.red.shade400),
                          );
                        }
                      }
                    },
                    child: const Text("Log In", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),

                const SizedBox(height: 15),

                // Sign Up Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?", style: TextStyle(fontSize: 14, color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: const Text("Sign Up", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Terms and Privacy Policy
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text.rich(
                    TextSpan(
                      text: "By logging in, you agree to our ",
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Terms of Service",
                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
