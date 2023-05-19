import 'package:flutter/material.dart';
import 'package:maximagri/models/user_profile_model/user_profile_model.dart';

class UserProfileCard extends StatelessWidget {
  final UserProfile userProfile;

  const UserProfileCard({Key? key, required this.userProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String address =
        '${userProfile.userAddress.province}, ${userProfile.userAddress.district}, '
        '${userProfile.userAddress.tehsil}';
    return InkWell(
      onTap: () {
        // onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shadowColor: Colors.green,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.green),
                      title: Text(userProfile.userName.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading:
                          const Icon(Icons.person_outline, color: Colors.green),
                      title: Text(userProfile.userType.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.credit_card, color: Colors.green),
                      title: Text(userProfile.userCNIC.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.phone, color: Colors.green),
                      title: Text(userProfile.userMobile.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.green),
                      title: Text(address,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
