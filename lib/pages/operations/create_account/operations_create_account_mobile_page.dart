import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/models/address_model/district_model.dart';
import 'package:maximagri/models/address_model/province_model.dart';
import 'package:maximagri/models/user_profile_model/user_address_model.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';
import 'package:maximagri/pages/auth/sign_in/sign_in_mobile_page.dart';
import 'package:maximagri/pages/operations/create_account/verify_code.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';
import 'package:maximagri/widgets/navigation/operations_navigation.dart';

class OperationsCreateAccountMobilePage extends StatefulWidget {
  const OperationsCreateAccountMobilePage({Key? key}) : super(key: key);

  @override
  State<OperationsCreateAccountMobilePage> createState() =>
      _OperationsCreateAccountMobilePageState();
}

class _OperationsCreateAccountMobilePageState
    extends State<OperationsCreateAccountMobilePage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    cnicController.dispose();
    provinceController.dispose();
    districtController.dispose();
    cnicController.dispose();
    townController.dispose();

    nameController.clear();
    phoneController.clear();
    cnicController.clear();
    provinceController.clear();
    districtController.clear();
    cnicController.clear();
    townController.clear();
  }

  // User hierarchy

  String? selectedZonalManager;
  String? selectedSalesManager;
  String? selectedSalesOfficer;
  List<String> zonalManagers = [];
  List<String> salesManagers = [];
  List<String> salesOfficers = [];


  Future<void> fetchZonalManagers() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('userProfile')
        .where('userType', isEqualTo: 'zonalManager')
        .get();
    setState(() {
      zonalManagers =
          snapshot.docs.map((doc) => doc['userName'] as String).toList();
    });
  }

  Future<void> fetchSalesManagers(String zonalManagerUID) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('userProfile')
        .where('userType', isEqualTo: 'salesManager')
        .where('zonalManagerUID', isEqualTo: zonalManagerUID)
        .get();
    setState(() {
      salesManagers =
          snapshot.docs.map((doc) => doc['userName'] as String).toList();
      selectedSalesManager = null;
      selectedSalesOfficer = null;
    });
  }

  Future<void> fetchSalesOfficers(String salesManagerUID) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('userProfile')
        .where('userType', isEqualTo: 'salesOfficer')
        .where('salesManagerUID', isEqualTo: salesManagerUID)
        .get();
    setState(() {
      salesOfficers =
          snapshot.docs.map((doc) => doc['userName'] as String).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchZonalManagers();
  }


  // User hierarchy end


  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _fromKey = GlobalKey<FormState>();

   final List<Province> _provinces = [
    Province(provinceName: 'America', districtsList: [
      District(
        districtName: 'Kalat',
        tehsilsList: ['Quetta', 'Turbat', 'Khuzdar', 'Hub'],
      ),
      District(
        districtName: 'Lahore',
        tehsilsList: ['Gojra', 'Hyderabad', 'Jhang', 'Kandhkot'],
      ),
      District(
        districtName: 'Swat',
        tehsilsList: ['Quetta', 'Rawalpini', 'Peshawar', 'Swabi'],
      ),
    ]),
    Province(provinceName: 'Pakistan', districtsList: [
      District(
          districtName: 'Punjab',
          tehsilsList: ['mulatn', 'okara', 'peshaw', 'faislabae']),
      District(
          districtName: 'Multan',
          tehsilsList: ['Peshawar', 'Khuzdar', 'Kandhkot', 'Gojra']),
    ]),
  ];

  String? _selectedProvinces;
  String? _selectedDistrict;
  String? _selectedCity;

  // void _createAccount() async {
  //   if (_fromKey.currentState!.validate()) {
  //     if (_auth.currentUser != null) {
  //       final user = UserProfile(
  //         operationsUID: '',
  //         zonalManagerUID: '',
  //         salesManagerUID: '',
  //         salesOfficerUID: '',
  //         userName: nameController.text,
  //         userMobile: int.parse(phoneController.text).toString(),
  //         userCNIC:
  //             int.parse(cnicController.text.replaceAll('-', '')).toString(),
  //         userType: 'Dealer',
  //         userUID: _auth.currentUser!.uid,
  //         userStatus: true,
  //         userAddress: UserAddress(
  //           province: _selectedProvinces!,
  //           district: _selectedDistrict!,
  //           tehsil: _selectedCity!,
  //         ),
  //       );
  //       _firestore
  //           .collection("Profile")
  //           .doc()
  //           .set(user.toJson())
  //           .then((value) => print("Successfully data Add"))
  //           .then((value) {
  //         // Navigator.push(
  //         //     context, MaterialPageRoute(builder: (_) => LoginScreen()));
  //       })
  //           .then((value) async {
  //         await _auth.verifyPhoneNumber(
  //             timeout: const Duration(seconds: 60),
  //             phoneNumber: phoneController.text,
  //             verificationCompleted: (_) {},
  //             verificationFailed: (FirebaseAuthException e) {
  //               if (e.code == 'invalid-phone-number') {
  //                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //                     content:
  //                         Text('The provided phone number is not valid.')));
  //               } else {
  //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                     content: Text(
  //                         'Phone number verification failed: ${e.message}')));
  //               }
  //             },
  //             codeSent: (String verificationId, int? resendToken) {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (_) =>
  //                           VerifyCodeScreen(verificationId: verificationId)));
  //             },
  //             codeAutoRetrievalTimeout: (e) {
  //               ScaffoldMessenger.of(context)
  //                   .showSnackBar(SnackBar(content: Text(e.toString())));
  //             });
  //       });
  //     }
  //   }
  // }

  bool _isCreatingAccount = false;

  void _createAccount() async {
    if (_fromKey.currentState!.validate()) {
      setState(() {
        _isCreatingAccount = true;
      });
      try {

        await FirebaseAuth.instance.signOut();
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        final user = UserProfile(
          operationsUID: '',
          zonalManagerUID: '',
          salesManagerUID: '',
          salesOfficerUID: '',
          userName: nameController.text,
          userMobile: int.parse(phoneController.text).toString(),
          userCNIC: int.parse(cnicController.text.replaceAll('-', '')).toString(),
          userType: 'Dealer',
          userUID: userCredential.user!.uid,
          userStatus: true,
          userAddress: UserAddress(
            province: _selectedProvinces!,
            district: _selectedDistrict!,
            tehsil: _selectedCity!,
          ),
        );
        await _firestore
            .collection("Profile")
            .doc()
            .set(user.toJson());
        print("Successfully data Add");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully data Add")));
       Navigator.push(context, MaterialPageRoute(builder: (_) => VerifyCodeScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The password provided is too weak")));
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("email-already-in-use")));
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.toString())));
      }
      finally {
        setState(() {
          _isCreatingAccount = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OperationsCreateAccountMobilePage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.84,
            child: Form(
              key: _fromKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Enter the name
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        maxLines: 1,
                        validator: (value) {
                          final nameExp = RegExp(r'^[A-Za-z ]+$');
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          } else if (!nameExp.hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        maxLines: 1,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },

                        decoration: const InputDecoration(
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,

                        decoration: const InputDecoration(
                          labelText: 'Enter Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Number is required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Phone',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Enter the cnic
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        validator: (value) {
                          final cnicExp = RegExp(r'^\d{5}-\d{7}-\d{1}$');
                          if (value == null || value.isEmpty) {
                            return 'CNIC number is required';
                          }
                          // else if (!cnicExp.hasMatch(value)) {
                          //   return 'Please enter a valid CNIC number';
                          // }
                          return null;
                        },
                        controller: cnicController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Cnic Num',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Zonal Manager',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedZonalManager,
                      items: zonalManagers.map((manager) {
                        return DropdownMenuItem<String>(
                          value: manager,
                          child: Text(manager),
                        );
                      }).toList(),
                      onChanged: (value) async {
                        setState(() {
                          selectedZonalManager = value;
                          selectedSalesManager = null;
                          selectedSalesOfficer = null;
                        });

                        var snapshot = await FirebaseFirestore.instance
                            .collection('userProfile')
                            .where('userName', isEqualTo: value)
                            .get();

                        var selectedZonalManagerDoc = snapshot.docs.firstWhere(
                              (doc) => doc['userName'] == value,
                          orElse: () => null!,
                        );

                        if (selectedZonalManagerDoc != null) {
                          var zonalManagerUID = selectedZonalManagerDoc['userUID'];
                          await fetchSalesManagers(zonalManagerUID);
                        }
                      },
                      validator: (value) =>
                      value == null ? 'Select the zonal manager' : null,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (selectedZonalManager != null)
                      DropdownButtonFormField<String>(
                        value: selectedSalesManager,
                        items: salesManagers.map((manager) {
                          return DropdownMenuItem<String>(
                            value: manager,
                            child: Text(manager),
                          );
                        }).toList(),
                        onChanged: (value) async {
                          setState(() {
                            selectedSalesManager = value;
                            selectedSalesOfficer = null;
                          });

                          var snapshot = await FirebaseFirestore.instance
                              .collection('userProfile')
                              .where('userName', isEqualTo: value)
                              .get();

                          var selectedSalesManagerDoc = snapshot.docs.firstWhere(
                                (doc) => doc['userName'] == value,
                            orElse: () => null!,
                          );

                          if (selectedSalesManagerDoc != null) {
                            var salesManagerUID = selectedSalesManagerDoc['userUID'];
                            await fetchSalesOfficers(salesManagerUID);
                          }
                        },
                        validator: (value) =>
                        value == null ? 'Select the sales manager' : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Sales Manager',
                        ),
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (selectedSalesManager != null)
                      DropdownButtonFormField<String>(
                        value: selectedSalesOfficer,
                        items: salesOfficers.map((officer) {
                          return DropdownMenuItem<String>(
                            value: officer,
                            child: Text(officer),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedSalesOfficer = value;
                          });
                        },
                        validator: (value) =>
                        value == null ? 'Select the sales officer' : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Sales Officer',
                        ),
                      ),
                    const SizedBox(
                      height: 16,
                    ),

                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                          labelText: 'Enter the Province',
                          border: OutlineInputBorder()),
                      value: _selectedProvinces,
                      items: _provinces
                          .map((province) => DropdownMenuItem(
                              value: province.provinceName,
                              child: Text(province.provinceName)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedProvinces = value;
                          _selectedDistrict = null;
                          _selectedCity = null;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Select the province' : null,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (_selectedProvinces != null)
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                            labelText: 'Enter the District',
                            border: OutlineInputBorder()),
                        value: _selectedDistrict,
                        items: _provinces
                            .firstWhere((province) =>
                                province.provinceName == _selectedProvinces)
                            .districtsList
                            .map((districts) => DropdownMenuItem(
                                value: districts.districtName,
                                child: Text(districts.districtName)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedDistrict = value;
                            _selectedCity = null;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Select the district' : null,
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (_selectedDistrict != null)
                      DropdownButtonFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter City',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              value == null ? 'Select the city' : null,
                          value: _selectedCity,
                          items: _provinces
                              .firstWhere((province) =>
                                  province.provinceName == _selectedProvinces)
                              .districtsList
                              .firstWhere((district) =>
                                  district.districtName == _selectedDistrict)
                              .tehsilsList
                              .map((city) => DropdownMenuItem(
                                  value: city, child: Text(city)))
                              .toList(),
                          onChanged: (value) {
                            _selectedCity = value;
                          }),

                    const SizedBox(
                      height: 20,
                    ),

                    InkWell(
                      onTap: () {
                        _createAccount();
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: _isCreatingAccount ? const CircularProgressIndicator(color: Colors.white,) : Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
