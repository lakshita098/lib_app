import 'package:flutter/material.dart';
import 'subject_grid_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Hardcoded login
                if (usernameController.text == "admin" &&
                    passwordController.text == "1234") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SubjectGridPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Invalid login")),
                  );
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
