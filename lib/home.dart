import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final canales = [
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales','canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
      'canales',
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration:
                const BoxDecoration(borderRadius: BorderRadiusDirectional.all(Radius.circular(10)), color: Colors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused)) {
                            return Colors.red; // El color cuando el botón está enfocado.
                          }
                          return null; // Dejar sin cambios cuando no está enfocado.
                        })),
                    onPressed: () {},
                    child: const Icon(Icons.list_alt_rounded)),
                Row(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return Colors.red; // El color cuando el botón está enfocado.
                              }
                              return null; // Dejar sin cambios cuando no está enfocado.
                            })),
                        onPressed: () {},
                        child: const Icon(Icons.person_rounded)),
                    ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return Colors.red; // El color cuando el botón está enfocado.
                              }
                              return null; // Dejar sin cambios cuando no está enfocado.
                            })),
                        onPressed: () {},
                        child: const Icon(Icons.update_rounded)),
                    ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return Colors.red; // El color cuando el botón está enfocado.
                              }
                              return null; // Dejar sin cambios cuando no está enfocado.
                            })),
                        onPressed: () {},
                        child: const Icon(Icons.logout_rounded)),
                  ],
                ),
              ],
            )

            // AppBar(
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            //   actions: [
            //     ElevatedButton(
            //         style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            //           if (states.contains(MaterialState.focused)) {
            //             return Colors.red; // El color cuando el botón está enfocado.
            //           }
            //           return null; // Dejar sin cambios cuando no está enfocado.
            //         })),
            //         onPressed: () {},
            //         child: const Icon(Icons.logout_rounded)),
            //     ElevatedButton(
            //         style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            //           if (states.contains(MaterialState.focused)) {
            //             return Colors.red; // El color cuando el botón está enfocado.
            //           }
            //           return null; // Dejar sin cambios cuando no está enfocado.
            //         })),
            //         onPressed: () {},
            //         child: const Icon(Icons.person_rounded)),
            //     ElevatedButton(style: ButtonStyle(
            //         overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            //           if (states.contains(MaterialState.focused)) {
            //             return Colors.red; // El color cuando el botón está enfocado.
            //           }
            //   return null; // Dejar sin cambios cuando no está enfocado.
            //         })
            //       ),onPressed: () {}, child: const Icon(Icons.update_rounded)),
            //   ],
            //   leading: ,
            // ),

            ),
      ),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            width: size.width * 0.15,
            decoration:
                const BoxDecoration(color: Colors.blue, borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
            child: Expanded(
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
          ),
          Container(
            width: size.width * 0.82,
            margin: const EdgeInsets.only(left: 10,bottom: 10),
            child: Expanded(
              child: Center(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (size.width * 0.70) / 4, 
                    childAspectRatio:
                        1 / 1, 
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: canales.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          overlayColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused)) {
                              return Colors.red; // El color cuando el botón está enfocado.
                            }
                            return Colors.white.withOpacity(0); // Dejar sin cambios cuando no está enfocado.
                          }),
                          backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused)) {
                              return Colors.blue; // El color cuando el botón está enfocado.
                            }
                            return Colors.white.withOpacity(0);
                          })),
                      onPressed: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue, borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
