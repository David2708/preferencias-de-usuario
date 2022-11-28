

import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {

  static const String routerName = 'Settings';
   
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // String name = 'David';
  // bool isDarkmode = true;
  // int gender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child:  Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
            ),
            const Divider(),
            SwitchListTile.adaptive(
              value:  Preferences.isDarkmode, 
              title: const Text('Darkmode'),
              onChanged: (value){
                Preferences.isDarkmode = value;
                final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                value
                  ? themeProvider.setDarktMode()
                  : themeProvider.setLightMode();
                setState(() {});
                print(themeProvider.currentTheme);
                print(value);
              }
            ),
            const Divider(),
            RadioListTile(
              title: const Text('Masculino'),
              value: 1, 
              groupValue: Preferences.gender, 
              onChanged: (value){
                Preferences.gender = value ?? 1;
                setState(() {});
              }
            ),
            const Divider(),
            RadioListTile(
              title: const Text('Femenino'),
              value: 2, 
              groupValue: Preferences.gender, 
              onChanged: (value){
                Preferences.gender = value ?? 2;
                setState(() {});
              }
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                initialValue: Preferences.name,
                onChanged: ((value) {
                  Preferences.name = value;
                  setState(() {});
                }),
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuairo',
                  
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}