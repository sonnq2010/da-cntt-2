import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/service/web_socket_service.dart';
import 'package:frontend/service/webrtc_service.dart';

void main() async {
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.prod");
  } else {
    await dotenv.load(fileName: ".env");
  }

  WidgetsFlutterBinding.ensureInitialized();
  await WebSocketService.I.initialize();
  await WebRTCService.I.initialize();
  runApp(const EnglishBuddy());
}

class EnglishBuddy extends StatefulWidget {
  const EnglishBuddy({super.key});

  @override
  State<EnglishBuddy> createState() => _EnglishBuddyState();
}

class _EnglishBuddyState extends State<EnglishBuddy> {
  // This widget is the root of your application.

  @override
  void dispose() {
    super.dispose();
    WebSocketService.I.dispose();
    WebRTCService.I.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Buddy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
