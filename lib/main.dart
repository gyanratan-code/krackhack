import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:flutter/material.dart';

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
import 'firebase_options.dart';

var CLOUDINARY_URL =
    'cloudinary://965385289918515:7VlJRstsqWldtRjsm6KAvFM_A70@dec8nkbl4';
var cloudinary = Cloudinary.fromStringUrl(CLOUDINARY_URL);
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
        });
  }
}
