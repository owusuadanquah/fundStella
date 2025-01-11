import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCVtYa0WVpZZ3zqxI0NC3K2OOLsOXODwIM",
            authDomain: "fund-stella.firebaseapp.com",
            projectId: "fund-stella",
            storageBucket: "fund-stella.firebasestorage.app",
            messagingSenderId: "703369635605",
            appId: "1:703369635605:web:a4564a83cacde0618e6b1c",
            measurementId: "G-MJQ3N0GRCT"));
  } else {
    await Firebase.initializeApp();
  }
}
