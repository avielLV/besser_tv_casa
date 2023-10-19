import 'package:besser_tv_casa/home.dart';
import 'package:besser_tv_casa/list_video.dart';
import 'package:besser_tv_casa/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ListVideoScreen(),
      ),
    );
  }
}