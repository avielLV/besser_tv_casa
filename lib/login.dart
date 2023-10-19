import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool switchValue = false;
  // final FocusScopeNode node = FocusScopeNode();
  final userFocus = FocusNode();
  final userWrapper = FocusNode();

  final passFocus = FocusNode();
  final passWrapper = FocusNode();
  final switchFocus = FocusNode();
  final btnNode = FocusNode();

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void initState() {
    userFocus.addListener(_listener);
    passFocus.addListener(_listener);
    btnNode.addListener(_listener);
    userWrapper.addListener(_listener);
    passWrapper.addListener(_listener);

    switchFocus.addListener(_listener);
    super.initState();
  }

  _listener() {
    if (userFocus.hasFocus ||
        userWrapper.hasFocus ||
        passFocus.hasFocus ||
        passWrapper.hasFocus ||
        switchFocus.hasFocus ||
        btnNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    userFocus.removeListener(_listener);
    passFocus.removeListener(_listener);
    btnNode.removeListener(_listener);
    userWrapper.removeListener(_listener);
    passWrapper.removeListener(_listener);
    switchFocus.removeListener(_listener);
    // node.dispose();
    userFocus.dispose();
    passFocus.dispose();
    switchFocus.dispose();
    btnNode.dispose();
    user.dispose();
    pass.dispose();
    super.dispose();
  }

  mover() async {
    // final resp1 = await ref
    //     .read(loginRemoteRepository)
    //     .loginUser(user: user.text, pass: pass.text)
    //     .then((value) => value.fold((l) => null, (r) => r));

    // SnackBarService.showSnackbar(resp.toString());
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    HttpClientRequest request = await httpClient
        .postUrl(Uri.parse("http://tv.bessersolutions.com:25461/player_api.php?username=${user.text}&password=${pass.text}"));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode({"key": "value"})));
    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();
    print(reply);

    // final resp2 = await Session.apiGet("http://tv.bessersolutions.com:25461/player_api.php?username=${user.text}&password=${pass.text}");
    // if (resp != null) {
    //   ref.read(getChannelsProvider);
    //   log(resp.toJson().toString());
    //   await ref.read(userLocalRepositoryProvider).saveUser(user: resp);
    //   vas();
    // } else {
    // mostrar mensaje de que error de login
    // }
    // log(resp2.toString());
    // SnackBarService.showSnackbar('httpCliente $reply');
    // SnackBarService.showSnackbar('httpCliente  $resp1');
    // SnackBarService.showSnackbar('httpCliente  $resp2');
  }

  vas() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 67, 198, 1),
      body: Stack(
        children: [
          // SizedBox(
          //   width: size.width,
          //   height: size.height,
          //   child: Image.asset(
          //     'assets/image/background_phone_login.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(color: Color.fromRGBO(0, 67, 198, 0.8)),
          ),
          Center(
            child: Container(
              width: 260,
              height: 280,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 14, 41, 1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: FocusScope(
                  autofocus: false,
                  onFocusChange: (val) {
                    // if (val) userFocus.requestFocus();
                  },
                  onKey: (FocusNode node, RawKeyEvent event) {
                    if (event is RawKeyUpEvent && event.data is RawKeyEventDataAndroid) {
                      RawKeyUpEvent rawKeyDownEvent = event;
                      RawKeyEventDataAndroid rawKeyEventDataAndroid = rawKeyDownEvent.data as RawKeyEventDataAndroid;
                      if (rawKeyEventDataAndroid.keyCode == KEY_CENTER) {
                        if (userFocus.hasFocus) {
                          userFocus.unfocus();
                          Future.delayed(Duration.zero).then((value) {
                            userFocus.requestFocus();
                          });
                        } else if (userWrapper.hasFocus) {
                          userFocus.requestFocus();
                        }
                        if (passFocus.hasFocus) {
                          passFocus.unfocus();
                          Future.delayed(Duration.zero).then((value) {
                            passFocus.requestFocus();
                          });
                        } else if (passWrapper.hasFocus) {
                          passFocus.requestFocus();
                        }
                      }

                      if (rawKeyEventDataAndroid.keyCode == KEY_DOWN) {
                        if (userWrapper.hasFocus) {
                          passFocus.requestFocus();
                        } else if (passFocus.hasFocus) {
                          btnNode.requestFocus();
                        } else {
                          userFocus.requestFocus();
                        }
                      }

                      if (rawKeyEventDataAndroid.keyCode == KEY_UP) {
                        if (btnNode.hasFocus) {
                          passFocus.requestFocus();
                        } else if (passFocus.hasFocus || passWrapper.hasFocus) {
                          userFocus.requestFocus();
                        } else {
                          btnNode.requestFocus();
                        }
                      }
                    }
                    return KeyEventResult.handled;
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Color.fromRGBO(0, 67, 198, 1), size: 54),
                          ),
                          Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      RawKeyboardListener(
                        focusNode: userWrapper,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(10),
                          width: 200,
                          height: 50,
                          child: Material(
                            child: TextField(
                              controller: user,
                              focusNode: userFocus,
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: 'Usuario', contentPadding: EdgeInsets.only(bottom: 10)),
                              autofocus: false,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RawKeyboardListener(
                        focusNode: passWrapper,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: const EdgeInsets.all(10),
                          width: 200,
                          height: 50,
                          child: Material(
                            child: TextField(
                              controller: pass,
                              focusNode: passFocus,
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: 'Contraseña', contentPadding: EdgeInsets.only(bottom: 10)),
                              autofocus: false,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Shortcuts(
                        shortcuts: <LogicalKeySet, Intent>{
                          LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
                          LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
                        },
                        child: ElevatedButton(
                          onPressed: () => mover(),
                          focusNode: btnNode,
                          child: Container(
                              decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(20))),
                              width: 160,
                              height: 40,
                              child: const Center(child: Text('Entrar'))),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

const int KEY_UP = 19;
const int KEY_DOWN = 20;
const int KEY_LEFT = 21;
const int KEY_RIGHT = 22;
const int KEY_CENTER = 23;
const int KEY_BACK = 4;