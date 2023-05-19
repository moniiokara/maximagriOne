import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';


class EditAboutUsMobilePage extends StatefulWidget {
  final String currentImage;
  final String currentTitle;
  final String currentDescription;

  const EditAboutUsMobilePage(
      {Key? key,
        required this.currentImage,
        required this.currentTitle,
        required this.currentDescription})
      : super(key: key);

  @override
  State<EditAboutUsMobilePage> createState() => _EditAboutUsMobilePageState();
}

class _EditAboutUsMobilePageState extends State<EditAboutUsMobilePage> {
  final _firestore = FirebaseFirestore.instance;

  TextEditingController imageController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    imageController.text = widget.currentImage;
    titleController.text = widget.currentTitle;
    descriptionController.text = widget.currentDescription;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditAboutUsMobilePage'),
      ),
      drawer: const OperationsDrawer(),
      bottomNavigationBar: const OperationsNavigation(selectedIndex: 2),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter the image Url';
                  }
                },
                controller: imageController,
                decoration: const InputDecoration(
                  labelText: 'Image Url',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter the title';
                  }
                },
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter the description';
                  }
                },
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _firestore
                          .collection("aboutUs")
                          .doc('data')
                          .update({
                        'image': imageController.text,
                        'title': titleController.text,
                        'description': descriptionController.text,
                      })
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Data Successfully Update")));
                      })
                          .then((value) => Navigator.pop(context))
                          .catchError((error) => Center(
                          child: Text("Failed to update user: $error")));
                    }
                  },
                  child: const Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}

