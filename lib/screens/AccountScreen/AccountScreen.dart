import 'package:flutter/material.dart';
import 'package:player_music_project/service/authservice.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("12213"),
      ),
      body: ElevatedButton(
        onPressed: () async {
          AuthService().signout(context: context);
        },
        child: const Text("EXIT"),
      ),
    );
  }
}
