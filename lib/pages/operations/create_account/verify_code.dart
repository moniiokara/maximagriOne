import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_mobile_page.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;

  const VerifyCodeScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController phoneController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                  hintText: 'Enter Code', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: phoneController.text);

                try {
                  await _auth.signInWithCredential(credential);
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const OperationsDashboardMobilePage()));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 40,
                width: double.infinity,
                child: const Center(
                  child: Text("Login"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
