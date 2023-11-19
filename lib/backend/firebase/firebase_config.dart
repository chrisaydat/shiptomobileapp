import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB-rhsIr6P4pnuZBRnGfgN9iRCPErjg6hw",
            authDomain: "shiptomobileapp.firebaseapp.com",
            projectId: "shiptomobileapp",
            storageBucket: "shiptomobileapp.appspot.com",
            messagingSenderId: "4774313612",
            appId: "1:4774313612:web:12f0d91e1d084a1cad45a9",
            measurementId: "G-5GSMM17S28"));
  } else {
    await Firebase.initializeApp();
  }
}
