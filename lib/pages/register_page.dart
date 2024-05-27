import 'package:chatting_app/services/auth/auth_service.dart';
import 'package:chatting_app/components/my_button.dart';
import 'package:chatting_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
  final TextEditingController _confirmpwcontroller = TextEditingController();

  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  void register(BuildContext context) {
    final _auth = AuthService();

    if (_pwcontroller.text == _confirmpwcontroller.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailcontroller.text,
          _pwcontroller.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            //
            const SizedBox(height: 50),
            //
            Text(
              "Let's Create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            //
            const SizedBox(height: 25),
            //
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailcontroller,
            ),
            //
            const SizedBox(height: 10),
            //
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwcontroller,
            ),
            //
            const SizedBox(height: 10),
            //
            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpwcontroller,
            ),
            //
            const SizedBox(height: 25),
            MyButton(
              onTap: () => register(context),
              text: 'Register',
            ),
            //
            const SizedBox(height: 25),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Login Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
