import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  String? _gender = 'Male';
  bool _ml = true;
  bool _fullstack = true;
  bool _mobile = false;
  double _tuition = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text(
                      'Welcome Back!!!',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text('Username', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        ),
                        validator: (value) => (value == null || value.length < 10)
                            ? 'Username must be 10 char long'
                            : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        ),
                        validator: (value) => (value == null || value.length < 8)
                            ? 'Password must be 8 char long'
                            : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text('Sex', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Radio(
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (val) => setState(() => _gender = val),
                    ),
                    const Text('Male'),
                    Radio(
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (val) => setState(() => _gender = val),
                    ),
                    const Text('Female'),
                  ],
                ),
                const SizedBox(height: 12),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text('Courses', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Checkbox(value: _ml, onChanged: (v) => setState(() => _ml = v ?? false)),
                          const Text('Machine Learning'),
                        ]),
                        Row(children: [
                          Checkbox(value: _fullstack, onChanged: (v) => setState(() => _fullstack = v ?? false)),
                          const Text('Full stack'),
                        ]),
                        Row(children: [
                          Checkbox(value: _mobile, onChanged: (v) => setState(() => _mobile = v ?? false)),
                          const Text('Mobile application'),
                        ]),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                const Text('Tuition', style: TextStyle(fontWeight: FontWeight.bold)),
                Slider(
                  value: _tuition,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: _tuition.round().toString(),
                  onChanged: (val) => setState(() => _tuition = val),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[200]),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Submitted successful 🥳🥳🥳')),
                          );
                        }
                      },
                      child: const Text('Submit', style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        _formKey.currentState?.reset();
                        setState(() {
                          _gender = 'Male';
                          _ml = true;
                          _fullstack = true;
                          _mobile = false;
                          _tuition = 20.0;
                        });
                      },
                      child: const Text('Clear', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}