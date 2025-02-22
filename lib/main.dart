// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:newser/views/add_news.dart';
// import 'package:newser/views/edit_profile.dart';
// import 'package:newser/views/home.dart';
// import 'package:newser/views/login.dart';
// import 'package:newser/views/new_news_confirmation.dart';
// import 'package:newser/views/notifications.dart';
// import 'package:newser/views/profile.dart';
// import 'package:newser/views/search.dart';
// import 'package:newser/views/signup.dart';
// import 'firebase_options.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   print("✅ Firebase initialized successfully!");
//   await dotenv.load(fileName: ".env");
//   // await dotenv.load(fileName: ".env");
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'News App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       routes: {
//         // "/": (context) => CheckUser(),
//         // "/home": (context) => HomePage(),
//         "/": (context) => HomePage(),
//         "/profile": (context) {
//           final user = FirebaseAuth.instance.currentUser; // Get logged-in user
//           return ProfilePage(userId: user?.uid ?? "");
//         },
//         // "/profile": (context) => ProfilePage(),
//         "/notification": (context) => ActivityPage(),
//         "/new_news_confirmation": (context) => NewNewsConfirmation(),
//         "/home": (context) => HomePage(),
//         "/new": (context) => AddNews(),
//         "/search": (context) => SearchPage(),
//         "/signup": (context) => SignUp(),
//         "/login": (context) => LoginPage(),
//         "/edit_profile": (context) => EditProfilePage(),
//         // "/upload": (context) => UploadArea()
//       },
//     );
//   }
// }
//
// // class CheckUser extends StatefulWidget {
// //   const CheckUser({super.key});
// //
// //   @override
// //   State<CheckUser> createState() => _CheckUserState();
// // }
//
// // class _CheckUserState extends State<CheckUser> {
// //   @override
// //   void initState() {
// //     AuthService().isLoggedIn().then((value){
// //       if(value){
// //         Navigator.pushReplacementNamed(context, "/home");
// //       }else{
// //         Navigator.pushReplacementNamed(context, "/login");
// //       }
// //     });
// //     super.initState();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: CircularProgressIndicator(),
// //       ),
// //     );
// //   }
// // }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iit_marketing/views/addItem.dart';
import 'package:iit_marketing/views/home.dart';
import 'package:iit_marketing/views/login.dart';
import 'package:iit_marketing/views/newNewsConfirmation.dart';
import 'package:iit_marketing/views/orders.dart';
import 'package:iit_marketing/views/signup.dart';
// import 'package:newser/views/add_news.dart';
// import 'package:newser/views/edit_profile.dart';
// import 'package:newser/views/home.dart';
// import 'package:newser/views/login.dart';
// import 'package:newser/views/new_news_confirmation.dart';
// import 'package:newser/views/news_details_page.dart';
// import 'package:newser/views/notifications.dart';
// import 'package:newser/views/profile.dart';
// import 'package:newser/views/search.dart';
// import 'package:newser/views/signup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("✅ Firebase initialized successfully!");
  // await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        onGenerateRoute: (settings) {
          // ✅ Handle News Detail Page Route
          // if (settings.name == "/news_detail") {
          //   final args = settings.arguments as Map<String, String>;
          //   return MaterialPageRoute(
          //     builder: (context) => News(
          //       newsId: args["newsId"]!,
          //       userId: args["userId"]!,
          //     ),
          //   );
          // }

          // ✅ Handle New News Confirmation Route
          if (settings.name == "/new_news_confirmation") {
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) => NewNewsConfirmation(
                title: args["title"]!,
                description: args["description"]!,
                longDescription: args["longDescription"]!,
              ),
            );
          }

          // ✅ Default Routes
          switch (settings.name) {
            case "/":
              return MaterialPageRoute(builder: (context) => HomePage());
            // case "/profile":
            //   final user = FirebaseAuth.instance.currentUser;
            //   return MaterialPageRoute(
            //       builder: (context) => ProfilePage(userId: user?.uid ?? ""));
            // case "/notification":
            //   return MaterialPageRoute(builder: (context) => ActivityPage());
            case "/home":
              return MaterialPageRoute(builder: (context) => HomePage());
            case "/new":
              return MaterialPageRoute(builder: (context) => AddNews());
            case "/orders":
              return MaterialPageRoute(builder: (context) => OrdersPage());
            case "/signup":
              return MaterialPageRoute(builder: (context) => SignUp());
            case "/login":
              return MaterialPageRoute(builder: (context) => Login());
            // case "/edit_profile":
            //   return MaterialPageRoute(builder: (context) => EditProfilePage());
            default:
              return MaterialPageRoute(builder: (context) => HomePage());
          }
        }
    );
  }
}
