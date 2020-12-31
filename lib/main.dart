import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hashcode/custom/custom_colors.dart';
import 'package:hashcode/screens/home.dart';
import 'package:hashcode/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black, //set status bar color
    ));
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (context)=> ThemeChanger(ThemeData.dark()),
      child: HashCodeApp()
    );
  }
}


class HashCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'HashCode App',
      home: Home(),
      theme: theme.getTheme(),
    );
  }
}




