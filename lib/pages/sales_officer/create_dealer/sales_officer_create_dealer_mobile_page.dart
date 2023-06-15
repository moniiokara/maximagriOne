import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/models/address_model/district_model.dart';
import 'package:maximagri/models/address_model/province_model.dart';
import 'package:maximagri/models/user_profile_model/user_address_model.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';
import 'package:maximagri/pages/operations/create_account/verify_code.dart';
import 'package:maximagri/widgets/drawer/sales_officer_drawer.dart';
import 'package:maximagri/widgets/navigation/sales_officer_navigation.dart';

class SalesOfficerCreateDealerMobilePage extends StatefulWidget {
  const SalesOfficerCreateDealerMobilePage({Key? key}) : super(key: key);

  @override
  State<SalesOfficerCreateDealerMobilePage> createState() =>
      _SalesOfficerCreateDealerMobilePageState();
}

class _SalesOfficerCreateDealerMobilePageState
    extends State<SalesOfficerCreateDealerMobilePage> {

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



  String? _selectedProvinces;
  String? _selectedDistrict;
  String? _selectedCity;

  List<UserProfile> zonalManagersProfiles = [];
  List<UserProfile> salesManagersProfiles = [];
  List<UserProfile> salesOfficersProfiles = [];

  @override
  void initState() {
    super.initState();
    fetchZonalManagers();
    fetchSalesManagers();
    fetchSalesOfficers();
  }

  void fetchZonalManagers() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('userProfile').where('userType', isEqualTo: 'Zonal Manager').get();
    setState(() {
      zonalManagersProfiles = snapshot.docs.map((doc) => UserProfile.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  void fetchSalesManagers() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('userProfile').where('userType', isEqualTo: 'Sales Manager').get();
    setState(() {
      salesManagersProfiles = snapshot.docs.map((doc) => UserProfile.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  void fetchSalesOfficers() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('userProfile').where('userType', isEqualTo: 'Sales Officer').get();
    setState(() {
      salesOfficersProfiles = snapshot.docs.map((doc) => UserProfile.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
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
          zonalManagerUID: selectedZonalManager.toString(),
          salesManagerUID: selectedSalesManager.toString(),
          salesOfficerUID: selectedSalesOfficer.toString(),
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => const VerifyCodeScreen()));
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
        title: const Text('SalesOfficerCreateDealerMobilePage'),
      ),
      drawer: const SalesOfficerDrawer(),
      bottomNavigationBar: const SalesOfficerNavigation(selectedIndex: 3),
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
                    DropdownButtonFormField<UserProfile>(
                      decoration: const InputDecoration(
                        labelText: 'Zonal Manager',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedZonalManager != null ?
                      zonalManagersProfiles.firstWhere((profile) => profile.userUID == selectedZonalManager) : null,
                      items: zonalManagersProfiles.map((profile) {
                        return DropdownMenuItem<UserProfile>(
                          value: profile,
                          child: Text(profile.userName),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedZonalManager = value!.userUID;
                        });
                      },
                      validator: (value) =>
                      value == null ? 'Select the Zonal Manager' : null,
                    ),
                   const SizedBox(height: 16,),
                    DropdownButtonFormField<UserProfile>(
                      decoration: const InputDecoration(
                        labelText: 'Sales Manager',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedSalesManager != null ? salesManagersProfiles.firstWhere((profile) => profile.userUID == selectedSalesManager) : null,
                      items: salesManagersProfiles.map((profile) {
                        return DropdownMenuItem<UserProfile>(
                          value: profile,
                          child: Text(profile.userName),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSalesManager = value!.userUID;
                        });
                      },
                      validator: (value) =>
                      value == null ? 'Select the Sales Manager' : null,
                    ),
                    const SizedBox(height: 16,),
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
