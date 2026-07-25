import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileDetailScreen extends StatefulWidget {
  final UserModel user;

  const ProfileDetailScreen({super.key, required this.user});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  // بنعمل نسخة "قابلة للتعديل" من الـ user جوا الـ State
  late UserModel _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              // await: بنوقف هون ونستنى لحد ما شاشة التعديل ترجع نتيجة
              final result = await Navigator.pushNamed(
                context,
                '/edit-profile',
                arguments: _currentUser,
              );

              // لو رجعت قيمة (يعني ضغط Save changes)، منحدث الشاشة
              if (result != null && result is UserModel) {
                setState(() {
                  _currentUser = result;
                });
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.deepPurple.shade100,
                child: Text(
                  _currentUser.initials,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Text(
                _currentUser.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _currentUser.jobTitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),

              const SizedBox(height: 28),

              _InfoCard(label: 'Bio', value: _currentUser.bio),
              const SizedBox(height: 12),
              _InfoCard(label: 'Email', value: _currentUser.email),
              const SizedBox(height: 12),
              _InfoCard(label: 'Phone', value: _currentUser.phone),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const _InfoCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.orange.shade700),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
