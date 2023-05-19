import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/pages/about/edit_about_us/edit_about_us_mobile_page.dart';

class AboutUsMobilePage extends StatefulWidget {
  final Widget pageDrawer;
  final Widget pageNavigation;
  const AboutUsMobilePage(
      {Key? key, required this.pageDrawer, required this.pageNavigation})
      : super(key: key);

  @override
  State<AboutUsMobilePage> createState() => _AboutUsMobilePageState();
}

class _AboutUsMobilePageState extends State<AboutUsMobilePage> {
  final _fireStore = FirebaseFirestore.instance;

  String? image;
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutUsMobilePage'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  EditAboutUsMobilePage(
                        currentImage: image ?? "",
                        currentTitle: title ?? "",
                        currentDescription: description ?? "",
                      )));
            },
          ),
        ],
      ),
      drawer: widget.pageDrawer,
      bottomNavigationBar: widget.pageNavigation,
      body: FutureBuilder(
        future: _fireStore.collection('aboutUs').doc('data').get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }
          final data = snapshot.data?.data();
          if (data == null) {
            return const Text("No data");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  //color: Colors.red,

                  image: DecorationImage(
                    image: NetworkImage(data['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '${data['title']}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '${data['description']}',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

