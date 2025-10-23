import 'package:flutter/material.dart';
import 'package:hassan_abdullah_apis/provider/user.dart';
import 'package:hassan_abdullah_apis/views/update_profile.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        children: [
          Text(
            "Name: ${userProvider.getUser().user!.name.toString()}",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "Email: ${userProvider.getUser()!.user!.email.toString()}",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateProfileView()),
              );
            },
            child: Text("Go to Update Profile"),
          ),
        ],
      ),
    );
  }
}
