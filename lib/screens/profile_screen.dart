import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final cards = <Map<String, dynamic>>[
      {
        'elevation': 1.0,
        'user': user.name,
        'age': user.age,
        'occupation': user.occupation
      } 
    ];
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Perfil',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("Usuario agregado",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ...cards.map((card) => _CardType2(
                    user: card['user'],
                    age: card['age'],
                    occupation: card['occupation'],
                    elevation: card['elevation'],
                  )),
              const SizedBox(height: 15),
              ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text("Regresar a Inicio"),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String user;
  final String age;
  final String occupation;
  final double elevation;

  const _CardType2({
    required this.user,
    required this.age,
    required this.occupation,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          color: Colors.lightGreen,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                user,
                style:const TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("Edad: $age"),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("Ocupación: $occupation"),
            ),
          ],
        ),
      ),
    );
  }
}
