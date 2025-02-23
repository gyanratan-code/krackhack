import 'package:flutter/material.dart';
import 'package:iit_marketing/services/auth_services.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ✅ Center the entire form
        child: SingleChildScrollView(
          // ✅ Allows scrolling if needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // ✅ Center vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // ✅ Center horizontally
              children: [
                const SizedBox(height: 40),

                // App Name
                const Text(
                  "IIT Mandi Marketplace",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),

                const SizedBox(height: 10),

                // Subtitle
                const Text("Create an account",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const Text("Enter your email to sign up for this app",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),

                const SizedBox(height: 20),

                // ✅ Wrapped Input Fields with Form
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Email Input
                      TextFormField(
                        validator: (value) => value == null || value.isEmpty
                            ? "Email cannot be empty"
                            : null,
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Institute Email ID",
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Password Input
                      TextFormField(
                        validator: (value) => value == null || value.length < 8
                            ? "Password should have at least 8 characters"
                            : null,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Password",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already signed up?",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text("Log in",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Continue Button (Black)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print(
                            "🔹 Trying to create account with: ${_emailController.text}");

                        String result = await AuthService()
                            .createAccountWithEmail(_emailController.text,
                                _passwordController.text);

                        if (result == "Account created") {
                          print("✅ Account successfully created!");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Account Created")),
                          );
                          Navigator.restorablePushNamedAndRemoveUntil(
                              context, "/edit_profile", (route) => false);
                        } else {
                          print("❌ Error: $result");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(result),
                                backgroundColor: Colors.red.shade400),
                          );
                        }
                      }
                    },
                    child: const Text("Continue",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),

                const SizedBox(height: 18),

                // Terms and Privacy Policy
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text.rich(
                    TextSpan(
                      text: "By clicking continue, you agree to our ",
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Terms of Service",
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
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
