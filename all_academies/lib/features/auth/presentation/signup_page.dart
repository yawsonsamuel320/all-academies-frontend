import 'package:flutter/material.dart';
import '../data/auth_repository.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _institutionController = TextEditingController();
  String _selectedUserType = "student"; // Default value

  void _signup() async {
    final authRepo = AuthRepository();
    await authRepo.signup(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      userType: _selectedUserType,
      educationalInstitution: _institutionController.text.isNotEmpty
          ? _institutionController.text
          : null,
      avatar: null, // Avatar can be added later
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: "First Name")),
              TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: "Last Name")),
              TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email")),
              TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true),
              TextField(
                  controller: _institutionController,
                  decoration: const InputDecoration(
                      labelText: "Educational Institution (Optional)")),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedUserType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedUserType = newValue!;
                  });
                },
                items: ["student", "teacher", "admin"].map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.toUpperCase()),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: "User Type"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _signup, child: const Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}
