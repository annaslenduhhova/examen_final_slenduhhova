import 'package:examen_final_slenduhhova/providers/perro_provider.dart';
import 'package:examen_final_slenduhhova/screens/crear_perro_screen.dart';
import 'package:examen_final_slenduhhova/screens/details_screen.dart';
import 'package:examen_final_slenduhhova/screens/home_screen.dart';
import 'package:examen_final_slenduhhova/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final loggedIn = prefs.getString('username') != null;

  runApp(MyApp(initialRoute: loggedIn ? 'home' : 'login'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PerroProvider()),
      ],
      child: MaterialApp(
        title: 'Examen Final',
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'crearPerro': (_) => PerrosScreen(),      
        },
      ),
    );
  }
}