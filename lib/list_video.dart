import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListVideoScreen extends ConsumerStatefulWidget {
  const ListVideoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListVideoScreenState();
}

class _ListVideoScreenState extends ConsumerState<ListVideoScreen> {

       bool categBool = false;
  @override
  Widget build(BuildContext context) {
       final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              FocusScope(
                onFocusChange: (val){
                  log(val.toString());
                  categBool = val;
                  setState(() {
                    
                  });
                },
                onKey: (node, event) {
                  if(event is RawKeyUpEvent && event.data is RawKeyEventDataAndroid){
                      RawKeyUpEvent rawKeyDownEvent = event;
                      RawKeyEventDataAndroid rawKeyEventDataAndroid = rawKeyDownEvent.data as RawKeyEventDataAndroid;
                    if(rawKeyEventDataAndroid.keyCode == KEY_LEFT){
                      log('Izquierda');
                    } else 
                    if(rawKeyEventDataAndroid.keyCode == KEY_RIGHT){
                      log('Derecha');
                    }else if (rawKeyEventDataAndroid.keyCode == KEY_DOWN){
                      FocusScope.of(context).nextFocus();
                    }
                  }
                  return KeyEventResult.handled;
                },
                child: Container(
                  color:categBool? Colors.green:Colors.yellow,
                  width: size.width * 0.16,
                  height: 60,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.arrow_left_rounded),
                      Text('Categoria'),
                      Icon(Icons.arrow_right_rounded),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                width: size.width * 0.16,
                height: size.height - 60,
                decoration: const BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadiusDirectional.all(Radius.circular(0))),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return Colors.red; // El color cuando el botón está enfocado.
                              }
                              return null; // Dejar sin cambios cuando no está enfocado.
                            })),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Icon(Icons.list_alt_rounded), Text('Categoria')],
                        ));
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    width: size.width * 0.42,
                    height: size.height * 0.5,
                  ),
                  Container(
                    color: Colors.grey,
                    width: size.width * 0.42,
                    height: size.height * 0.5,
                  ),
                ],
              ),
              Container(
                color: Colors.red,
                width: size.width * 0.84,
                height: size.height * 0.5,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Colors.red; // El color cuando el botón está enfocado.
              }
              return Colors.white.withOpacity(0); // Dejar sin cambios cuando no está enfocado.
            }),
          ),
          onPressed: () {},
          child: const Icon(Icons.home)),
    );
  
  }
}


const int KEY_UP = 19;
const int KEY_DOWN = 20;
const int KEY_LEFT = 21;
const int KEY_RIGHT = 22;
const int KEY_CENTER = 23;
const int KEY_BACK = 4;