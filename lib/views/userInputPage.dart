import 'package:flutter/material.dart';
import 'home.dart';
import 'package:iit_marketing/services/user_services.dart'; // update the import path accordingly

class ProfileSetupPage extends StatefulWidget {
  @override
  _ProfileSetupPageState createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool isButtonEnabled = false;

  void _validateFields() {
    setState(() {
      isButtonEnabled = _usernameController.text.trim().isNotEmpty &&
          _bioController.text.trim().isNotEmpty;
    });
  }

  Future<void> _submitProfile() async {
    if (isButtonEnabled) {
      try {
        // Save the profile info in Firestore using the current user's UID.
        await UserService().updateUserProfile(
          username: _usernameController.text.trim(),
          bio: _bioController.text.trim(),
        );
        // Navigate to HomePage once the profile is saved.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } catch (e) {
        // Handle errors (e.g., show a snackbar or dialog)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving profile: ${e.toString()}')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_validateFields);
    _bioController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setup Profile")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Complete Your Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _bioController,
                    decoration: InputDecoration(
                      labelText: "Short Bio",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxLines: 3,
                    maxLength: 100, // Limit to 100 characters
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isButtonEnabled ? _submitProfile : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
