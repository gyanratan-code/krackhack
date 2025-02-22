// // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:newser/services/auth_service.dart';
// // // // //
// // // // // class SignUp extends StatefulWidget {
// // // // //   const SignUp({super.key});
// // // // //
// // // // //   @override
// // // // //   State<SignUp> createState() => _SignUpState();
// // // // // }
// // // // //
// // // // // class _SignUpState extends State<SignUp> {
// // // // //   final formKey = GlobalKey<FormState>();
// // // // //   final TextEditingController _emailController = TextEditingController();
// // // // //   final TextEditingController _passwordController = TextEditingController();
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       body: Form(
// // // // //         key: formKey,
// // // // //         child: Center(
// // // // //           child: Column(
// // // // //             children: [
// // // // //               const SizedBox(height: 120,),
// // // // //               SizedBox(
// // // // //                 width: MediaQuery.of(context).size.width* .9,
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     const Text("Sign Up", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),),
// // // // //                     const Text("Create new account and get started"),
// // // // //                     const SizedBox(height: 10,),
// // // // //                     SizedBox(
// // // // //                       width: MediaQuery.of(context).size.width* .9,
// // // // //                       child: TextFormField(
// // // // //                         validator: (value) => value!.isEmpty ? "Email cannot be empty" : null,
// // // // //                         controller: _emailController,
// // // // //                         decoration: const InputDecoration(
// // // // //                           border: OutlineInputBorder(),
// // // // //                           label: Text("Email"),
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                     SizedBox(height: 10,),
// // // // //                     SizedBox(
// // // // //                       width: MediaQuery.of(context).size.width* .9,
// // // // //                       child: TextFormField(
// // // // //                         validator: (value) => value!.length < 8 ? "Password should have atleast 8 characters" : null,
// // // // //                         controller: _passwordController,
// // // // //                         obscureText: true,
// // // // //                         decoration: const InputDecoration(
// // // // //                           border: OutlineInputBorder(),
// // // // //                           label: Text("Password"),
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                     SizedBox(height: 10,),
// // // // //                     SizedBox(
// // // // //                       height: 60,
// // // // //                       width: MediaQuery.of(context).size.width* .9,
// // // // //                       child: ElevatedButton(onPressed: () async{
// // // // //                         // if(formKey.currentState!.validate()){
// // // // //                         //   await AuthService().createAccountWithEmail(_emailController.text, _passwordController.text).then((value){
// // // // //                         //     if(value == "Account created"){
// // // // //                         //       ScaffoldMessenger.of(context).showSnackBar(
// // // // //                         //           const SnackBar(content: Text("Account Created")));
// // // // //                         //       Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
// // // // //                         //     }
// // // // //                         //     else{
// // // // //                         //       ScaffoldMessenger.of(context)
// // // // //                         //           .showSnackBar(SnackBar(
// // // // //                         //         content: Text(
// // // // //                         //             value,
// // // // //                         //             style: const TextStyle(color: Colors.white)
// // // // //                         //         ),
// // // // //                         //         backgroundColor: Colors.red.shade400,
// // // // //                         //       ),
// // // // //                         //       );
// // // // //                         //     }
// // // // //                         //   });
// // // // //                         // }
// // // // //                       }, child: const Text("Sign Up", style: TextStyle(fontSize: 16),)),
// // // // //                     ),
// // // // //                     SizedBox(height: 10,),
// // // // //                     Row(
// // // // //                       mainAxisAlignment: MainAxisAlignment.center,
// // // // //                       children: [
// // // // //                         const Text("Already have an account ?"),
// // // // //                         TextButton(onPressed: (){
// // // // //                           Navigator.pushNamed(context, "/login");
// // // // //                         }, child: const Text("Login"))
// // // // //                       ],
// // // // //                     )
// // // // //                   ],
// // // // //                 ),
// // // // //               )
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // //
// // // // import 'package:flutter/material.dart';
// // // //
// // // // class SignUp extends StatefulWidget {
// // // //   const SignUp({super.key});
// // // //
// // // //   @override
// // // //   State<SignUp> createState() => _SignUpState();
// // // // }
// // // //
// // // // class _SignUpState extends State<SignUp> {
// // // //   final formKey = GlobalKey<FormState>();
// // // //   final TextEditingController _emailController = TextEditingController();
// // // //   final TextEditingController _passwordController = TextEditingController();
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: SingleChildScrollView(
// // // //         child: Center(
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.center,
// // // //             children: [
// // // //               const SizedBox(height: 80),
// // // //
// // // //               // App Name
// // // //               const Text(
// // // //                 "News Of All",
// // // //                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
// // // //               ),
// // // //
// // // //               const SizedBox(height: 10),
// // // //
// // // //               // Subtitle
// // // //               const Text("Create an account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // // //               const Text("Enter your email to sign up for this app", style: TextStyle(fontSize: 14, color: Colors.grey)),
// // // //
// // // //               const SizedBox(height: 20),
// // // //
// // // //               // Email Input
// // // //               SizedBox(
// // // //                 width: MediaQuery.of(context).size.width * 0.85,
// // // //                 child: TextFormField(
// // // //                   controller: _emailController,
// // // //                   decoration: InputDecoration(
// // // //                     filled: true,
// // // //                     fillColor: Colors.transparent,
// // // //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// // // //                     labelText: "EmailID",
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //
// // // //               const SizedBox(height: 15),
// // // //
// // // //               // Password Input
// // // //               SizedBox(
// // // //                 width: MediaQuery.of(context).size.width * 0.85,
// // // //                 child: TextFormField(
// // // //                   controller: _passwordController,
// // // //                   obscureText: true,
// // // //                   decoration: InputDecoration(
// // // //                     filled: true,
// // // //                     fillColor: Colors.transparent,
// // // //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// // // //                     labelText: "Password",
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //
// // // //               const SizedBox(height: 20),
// // // //
// // // //               // Continue Button (Black)
// // // //               SizedBox(
// // // //                 width: MediaQuery.of(context).size.width * 0.85,
// // // //                 height: 50,
// // // //                 child: ElevatedButton(
// // // //                   style: ElevatedButton.styleFrom(
// // // //                     backgroundColor: Colors.black,
// // // //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // // //                   ),
// // // //                   onPressed: () {},
// // // //                   child: const Text("Continue", style: TextStyle(fontSize: 16, color: Colors.white)),
// // // //                 ),
// // // //               ),
// // // //
// // // //               const SizedBox(height: 15),
// // // //
// // // //               // OR Divider
// // // //               Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // //                 children: [
// // // //                   Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1, indent: 40, endIndent: 10)),
// // // //                   const Text("or", style: TextStyle(color: Colors.grey)),
// // // //                   Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1, indent: 10, endIndent: 40)),
// // // //                 ],
// // // //               ),
// // // //
// // // //               const SizedBox(height: 15),
// // // //
// // // //               // Continue with Phone
// // // //               _socialLoginButton("Continue with Phone Number"),
// // // //
// // // //               // Continue with Google (With Colorful Logo)
// // // //               _googleSignInButton(),
// // // //
// // // //               // Continue with Apple
// // // //               _socialLoginButton("Continue with Apple", icon: Icons.apple),
// // // //
// // // //               const SizedBox(height: 15),
// // // //
// // // //               // Skip for Now
// // // //               TextButton(
// // // //                 onPressed: () {},
// // // //                 child: const Text("Skip for now", style: TextStyle(color: Colors.grey)),
// // // //               ),
// // // //
// // // //               const SizedBox(height: 10),
// // // //
// // // //               // Terms and Privacy Policy
// // // //               Padding(
// // // //                 padding: const EdgeInsets.symmetric(horizontal: 30),
// // // //                 child: Text.rich(
// // // //                   TextSpan(
// // // //                     text: "By clicking continue, you agree to our ",
// // // //                     style: const TextStyle(color: Colors.grey),
// // // //                     children: [
// // // //                       TextSpan(
// // // //                         text: "Terms of Service",
// // // //                         style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
// // // //                       ),
// // // //                       const TextSpan(text: " and "),
// // // //                       TextSpan(
// // // //                         text: "Privacy Policy",
// // // //                         style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   textAlign: TextAlign.center,
// // // //                 ),
// // // //               ),
// // // //
// // // //               const SizedBox(height: 20),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   // Social Login Button (White with 40% Opacity)
// // // //   Widget _socialLoginButton(String text, {IconData? icon}) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 5),
// // // //       child: SizedBox(
// // // //         width: MediaQuery.of(context).size.width * 0.85,
// // // //         height: 50,
// // // //         child: ElevatedButton(
// // // //           style: ElevatedButton.styleFrom(
// // // //             backgroundColor: Colors.white.withOpacity(0.7),
// // // //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // // //           ),
// // // //           onPressed: () {},
// // // //           child: Row(
// // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // //             children: [
// // // //               if (icon != null) Icon(icon, color: Colors.black, size: 22),
// // // //               if (icon != null) const SizedBox(width: 10),
// // // //               Text(text, style: const TextStyle(fontSize: 16, color: Colors.black)),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   // Google Sign-In Button with Colorful Logo
// // // //   Widget _googleSignInButton() {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 5),
// // // //       child: SizedBox(
// // // //         width: MediaQuery.of(context).size.width * 0.85,
// // // //         height: 50,
// // // //         child: ElevatedButton(
// // // //           style: ElevatedButton.styleFrom(
// // // //             backgroundColor: Colors.white.withOpacity(0.7),
// // // //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // // //           ),
// // // //           onPressed: () {},
// // // //           child: Row(
// // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // //             children: [
// // // //
// // // //               Image.asset(
// // // //                 'assets/images/google_logo.png', // Ensure this image is in your assets folder
// // // //                 height: 24,
// // // //                 width: 24,
// // // //               ),
// // // //               const SizedBox(width: 10),
// // // //               const Text("Continue with Google", style: TextStyle(fontSize: 16, color: Colors.black)),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:newser/services/auth_service.dart';
// // //
// // // class SignUp extends StatefulWidget {
// // //   const SignUp({super.key});
// // //
// // //   @override
// // //   State<SignUp> createState() => _SignUpState();
// // // }
// // //
// // // class _SignUpState extends State<SignUp> {
// // //   final formKey = GlobalKey<FormState>();
// // //   final TextEditingController _emailController = TextEditingController();
// // //   final TextEditingController _passwordController = TextEditingController();
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: SingleChildScrollView(
// // //         child: Center(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.center,
// // //             children: [
// // //               const SizedBox(height: 80),
// // //
// // //               // App Name
// // //               const Text(
// // //                 "News Of All",
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
// // //               ),
// // //
// // //               const SizedBox(height: 10),
// // //
// // //               // Subtitle
// // //               const Text("Create an account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
// // //               const Text("Enter your email to sign up for this app", style: TextStyle(fontSize: 14, color: Colors.grey)),
// // //
// // //               const SizedBox(height: 20),
// // //
// // //               // Email Input
// // //               SizedBox(
// // //                 width: MediaQuery.of(context).size.width * 0.90,
// // //                 child: TextFormField(
// // //                   validator: (value) => value!.isEmpty ? "Email cannot be empty" : null,
// // //                   controller: _emailController,
// // //                   decoration: InputDecoration(
// // //                     filled: true,
// // //                     fillColor: Colors.transparent,
// // //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// // //                     labelText: "EmailID",
// // //                   ),
// // //                 ),
// // //               ),
// // //
// // //               const SizedBox(height: 15),
// // //
// // //               // Password Input
// // //               SizedBox(
// // //                 width: MediaQuery.of(context).size.width * 0.90,
// // //                 child: TextFormField(
// // //                   validator: (value) => value!.length < 8 ? "Password should have atleast 8 characters" : null,
// // //                   controller: _passwordController,
// // //                   obscureText: true,
// // //                   decoration: InputDecoration(
// // //                     filled: true,
// // //                     fillColor: Colors.transparent,
// // //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// // //                     labelText: "Password",
// // //                   ),
// // //                 ),
// // //               ),
// // //
// // //               const SizedBox(height: 10),
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   const Text("Already signed up?", style: TextStyle(fontSize: 14, color: Colors.grey)),
// // //                   TextButton(
// // //                     onPressed: () {
// // //                       Navigator.pushNamed(context, "/login");
// // //                     },
// // //                     child: const Text("Log in", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
// // //                   ),
// // //                 ],
// // //               ),
// // //               const SizedBox(height: 10),
// // //
// // //               // Continue Button (Black)
// // //               SizedBox(
// // //                 width: MediaQuery.of(context).size.width * 0.90,
// // //                 height: 50,
// // //                 child: ElevatedButton(
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: Colors.black,
// // //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //                   ),
// // //                   onPressed: () async{
// // //                     // if(formKey.currentState!.validate()){
// // //                       await AuthService().createAccountWithEmail(_emailController.text, _passwordController.text).then((value){
// // //                         if(value == "Account created"){
// // //                           ScaffoldMessenger.of(context).showSnackBar(
// // //                               const SnackBar(content: Text("Account Created")));
// // //                           Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
// // //                         }
// // //                         else{
// // //                           ScaffoldMessenger.of(context)
// // //                               .showSnackBar(SnackBar(
// // //                             content: Text(
// // //                                 value,
// // //                                 style: const TextStyle(color: Colors.white)
// // //                             ),
// // //                             backgroundColor: Colors.red.shade400,
// // //                           ),
// // //                           );
// // //                         }
// // //                       });
// // //                     // }
// // //                   },
// // //                   child: const Text("Continue", style: TextStyle(fontSize: 16, color: Colors.white)),
// // //                 ),
// // //               ),
// // //
// // //               const SizedBox(height: 15),
// // //
// // //               // OR Divider
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1, indent: 40, endIndent: 10)),
// // //                   const Text("or", style: TextStyle(color: Colors.grey)),
// // //                   Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1, indent: 10, endIndent: 40)),
// // //                 ],
// // //               ),
// // //
// // //               const SizedBox(height: 15),
// // //
// // //               // Continue with Phone
// // //               _socialLoginButton("Continue with Phone Number"),
// // //
// // //               // Continue with Google (With Colorful Logo)
// // //               _googleSignInButton(),
// // //
// // //               // Continue with Apple
// // //               _socialLoginButton("Continue with Apple", icon: Icons.apple),
// // //
// // //               const SizedBox(height: 15),
// // //
// // //               // Skip for Now
// // //               TextButton(
// // //                 onPressed: () {},
// // //                 child: const Text("Skip for now", style: TextStyle(color: Colors.grey)),
// // //               ),
// // //
// // //               const SizedBox(height: 10),
// // //
// // //               // Terms and Privacy Policy
// // //               Padding(
// // //                 padding: const EdgeInsets.symmetric(horizontal: 30),
// // //                 child: Text.rich(
// // //                   TextSpan(
// // //                     text: "By clicking continue, you agree to our ",
// // //                     style: const TextStyle(color: Colors.grey),
// // //                     children: [
// // //                       TextSpan(
// // //                         text: "Terms of Service",
// // //                         style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
// // //                       ),
// // //                       const TextSpan(text: " and "),
// // //                       TextSpan(
// // //                         text: "Privacy Policy",
// // //                         style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   textAlign: TextAlign.center,
// // //                 ),
// // //               ),
// // //
// // //               const SizedBox(height: 20),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   // Social Login Button (White with 40% Opacity)
// // //   Widget _socialLoginButton(String text, {IconData? icon}) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 5),
// // //       child: SizedBox(
// // //         width: MediaQuery.of(context).size.width * 0.90,
// // //         height: 50,
// // //         child: ElevatedButton(
// // //           style: ElevatedButton.styleFrom(
// // //             backgroundColor: Colors.white.withOpacity(0.8),
// // //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //           ),
// // //           onPressed: () {},
// // //           child: Row(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               if (icon != null) Icon(icon, color: Colors.black, size: 22),
// // //               if (icon != null) const SizedBox(width: 10),
// // //               Text(text, style: const TextStyle(fontSize: 16, color: Colors.black)),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   // Google Sign-In Button with Colorful Logo
// // //   Widget _googleSignInButton() {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 5),
// // //       child: SizedBox(
// // //         width: MediaQuery.of(context).size.width * 0.90,
// // //         height: 50,
// // //         child: ElevatedButton(
// // //           style: ElevatedButton.styleFrom(
// // //             backgroundColor: Colors.white.withOpacity(0.8),
// // //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //           ),
// // //           onPressed: () {},
// // //           child: Row(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Image.asset(
// // //                 'assets/images/google.png', // Ensure this image is in your assets folder
// // //                 height: 28,
// // //                 width: 28,
// // //               ),
// // //               const SizedBox(width: 10),
// // //               const Text("Continue with Google", style: TextStyle(fontSize: 16, color: Colors.black)),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// import 'package:flutter/material.dart';
// import 'package:iit_marketing/services/auth_services.dart';
// // import 'package:newser/services/auth_service.dart';
//
// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 80),
//
//                 // App Name
//                 const Text(
//                   "News Of All",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 // Subtitle
//                 const Text("Create an account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//                 const Text("Enter your email to sign up for this app", style: TextStyle(fontSize: 14, color: Colors.grey)),
//
//                 const SizedBox(height: 20),
//
//                 // ✅ Wrapped Input Fields with Form
//                 Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       // Email Input
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.90,
//                         child: TextFormField(
//                           validator: (value) => value == null || value.isEmpty ? "Email cannot be empty" : null,
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.transparent,
//                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                             labelText: "Institute Email ID",
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 15),
//
//                       // Password Input
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.90,
//                         child: TextFormField(
//                           validator: (value) => value == null || value.length < 8 ? "Password should have at least 8 characters" : null,
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.transparent,
//                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                             labelText: "Password",
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Already signed up?", style: TextStyle(fontSize: 14, color: Colors.grey)),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, "/login");
//                       },
//                       child: const Text("Log in", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Continue Button (Black)
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.90,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     onPressed: () async {
//                       if (formKey.currentState!.validate()) {
//                         print("🔹 Trying to create account with: ${_emailController.text}");
//
//                         String result = await AuthService().createAccountWithEmail(
//                             _emailController.text,
//                             _passwordController.text
//                         );
//
//                         if (result == "Account created") {
//                           print("✅ Account successfully created!");
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("Account Created")),
//                           );
//                           // Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
//                           Navigator.restorablePushNamedAndRemoveUntil(context, "/edit_profile", (route) => false);
//
//                         } else {
//                           print("❌ Error: $result");
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text(result), backgroundColor: Colors.red.shade400),
//                           );
//                         }
//                       }
//                     },
//                     child: const Text("Continue", style: TextStyle(fontSize: 16, color: Colors.white)),
//                   ),
//                 ),
//                 SizedBox(height: 18,),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Text.rich(
//                     TextSpan(
//                       text: "By clicking continue, you agree to our ",
//                       style: const TextStyle(color: Colors.grey),
//                       children: [
//                         TextSpan(
//                           text: "Terms of Service",
//                           style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//                         ),
//                         const TextSpan(text: " and "),
//                         TextSpan(
//                           text: "Privacy Policy",
//                           style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//               ],
//             ),
//         ),
//       ),
//     );
//   }
//
//   // Social Login Button (White with 40% Opacity)
//   Widget _socialLoginButton(String text, {IconData? icon}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width * 0.90,
//         height: 50,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white.withOpacity(0.8),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//           onPressed: () {},
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (icon != null) Icon(icon, color: Colors.black, size: 22),
//               if (icon != null) const SizedBox(width: 10),
//               Text(text, style: const TextStyle(fontSize: 16, color: Colors.black)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Google Sign-In Button with Colorful Logo
//   Widget _googleSignInButton() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width * 0.90,
//         height: 50,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white.withOpacity(0.8),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//           onPressed: () {},
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/google.png',
//                 height: 28,
//                 width: 28,
//               ),
//               const SizedBox(width: 10),
//               const Text("Continue with Google", style: TextStyle(fontSize: 16, color: Colors.black)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:newser/services/auth_service.dart';
// //
// // class SignUp extends StatefulWidget {
// //   const SignUp({super.key});
// //
// //   @override
// //   State<SignUp> createState() => _SignUpState();
// // }
// //
// // class _SignUpState extends State<SignUp> {
// //   final formKey = GlobalKey<FormState>();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Form(
// //         key: formKey,
// //         child: Center(
// //           child: Column(
// //             children: [
// //               const SizedBox(height: 120,),
// //               SizedBox(
// //                 width: MediaQuery.of(context).size.width* .9,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const Text("Sign Up", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),),
// //                     const Text("Create new account and get started"),
// //                     const SizedBox(height: 10,),
// //                     SizedBox(
// //                       width: MediaQuery.of(context).size.width* .9,
// //                       child: TextFormField(
// //                         validator: (value) => value!.isEmpty ? "Email cannot be empty" : null,
// //                         controller: _emailController,
// //                         decoration: const InputDecoration(
// //                           border: OutlineInputBorder(),
// //                           label: Text("Email"),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 10,),
// //                     SizedBox(
// //                       width: MediaQuery.of(context).size.width* .9,
// //                       child: TextFormField(
// //                         validator: (value) => value!.length < 8 ? "Password should have atleast 8 characters" : null,
// //                         controller: _passwordController,
// //                         obscureText: true,
// //                         decoration: const InputDecoration(
// //                           border: OutlineInputBorder(),
// //                           label: Text("Password"),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 10,),
// //                     SizedBox(
// //                       height: 60,
// //                       width: MediaQuery.of(context).size.width* .9,
// //                       child: ElevatedButton(onPressed: () async{
// //                         if(formKey.currentState!.validate()){
// //                           await AuthService().createAccountWithEmail(_emailController.text, _passwordController.text).then((value){
// //                             if(value == "Account created"){
// //                               ScaffoldMessenger.of(context).showSnackBar(
// //                                   const SnackBar(content: Text("Account Created")));
// //                               Navigator.restorablePushNamedAndRemoveUntil(context, "/home", (route) => false);
// //                             }
// //                             else{
// //                               ScaffoldMessenger.of(context)
// //                                   .showSnackBar(SnackBar(
// //                                 content: Text(
// //                                     value,
// //                                     style: const TextStyle(color: Colors.white)
// //                                 ),
// //                                 backgroundColor: Colors.red.shade400,
// //                               ),
// //                               );
// //                             }
// //                           });
// //                         }
// //                       }, child: const Text("Sign Up", style: TextStyle(fontSize: 16),)),
// //                     ),
// //                     SizedBox(height: 10,),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         const Text("Already have an account ?"),
// //                         TextButton(onPressed: (){
// //                           Navigator.pushNamed(context, "/login");
// //                         }, child: const Text("Login"))
// //                       ],
// //                     )
// //                   ],
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


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
      body: Center( // ✅ Center the entire form
        child: SingleChildScrollView( // ✅ Allows scrolling if needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // ✅ Center vertically
              crossAxisAlignment: CrossAxisAlignment.center, // ✅ Center horizontally
              children: [
                const SizedBox(height: 40),

                // App Name
                const Text(
                  "IIT Mandi Marketplace",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),

                const SizedBox(height: 10),

                // Subtitle
                const Text("Create an account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const Text("Enter your email to sign up for this app", style: TextStyle(fontSize: 14, color: Colors.grey)),

                const SizedBox(height: 20),

                // ✅ Wrapped Input Fields with Form
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already signed up?", style: TextStyle(fontSize: 14, color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text("Log in", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print("🔹 Trying to create account with: ${_emailController.text}");

                        String result = await AuthService().createAccountWithEmail(
                            _emailController.text,
                            _passwordController.text
                        );

                        if (result == "Account created") {
                          print("✅ Account successfully created!");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Account Created")),
                          );
                          Navigator.restorablePushNamedAndRemoveUntil(context, "/edit_profile", (route) => false);
                        } else {
                          print("❌ Error: $result");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result), backgroundColor: Colors.red.shade400),
                          );
                        }
                      }
                    },
                    child: const Text("Continue", style: TextStyle(fontSize: 16, color: Colors.white)),
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
