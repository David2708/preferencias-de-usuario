import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routerName = 'home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      drawer: const SideMenu(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('IsDarmode: ${Preferences.isDarkmode}'),
          Divider(),
          Text('Género: ${Preferences.gender}'),
          Divider(),
          Text('Nombre del Usuario: ${Preferences.name}'),
          Divider(),
        ],
      )
    );
  }
}

