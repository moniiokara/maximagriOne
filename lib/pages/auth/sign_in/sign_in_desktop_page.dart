import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInDesktopPage extends StatefulWidget {
  const SignInDesktopPage({Key? key}) : super(key: key);

  @override
  State<SignInDesktopPage> createState() => _SignInDesktopPageState();
}

class _SignInDesktopPageState extends State<SignInDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(
            image: AssetImage(
              'lib/assets/images/maxim_logo.png',
            ),
            width: 400,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text('SignInDesktopPage'),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'operations@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN OPERATIONS')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'zonalmanager@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN ZONAL MANAGER')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'zonalmanager1@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN ZONAL MANAGER 1')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesmanager@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES MANAGER')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesmanager1@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES MANAGER 1')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesmanager2@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES MANAGER 2')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesmanager3@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES MANAGER 3')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesofficer@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES OFFICER')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesofficer1@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES OFFICER 1')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesofficer2@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES OFFICER 2')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesofficer3@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES OFFICER 3')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesofficer4@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES OFFICER 4')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesofficer5@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES OFFICER 5')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesofficer6@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES OFFICER 6')),
                  OutlinedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'salesofficer7@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN SALES OFFICER 7')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer1@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 1')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer2@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 2')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer3@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 3')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer4@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 4')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer5@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 5')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer6@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 6')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer7@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 7')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer8@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 8')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer9@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 9')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer10@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 10')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer11@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 11')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer12@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 12')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer13@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 13')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer14@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 14')),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: 'dealer15@microcorporate.com',
                            password: '8808044');
                      },
                      child: const Text('SIGN IN DEALER 15')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
