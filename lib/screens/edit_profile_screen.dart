import 'package:flutter/material.dart';
import '../models/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;

  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _jobTitleController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    // بنعبي الحقول ببيانات المستخدم الحالية (مو فاضية زي التسجيل)
    _nameController = TextEditingController(text: widget.user.name);
    _jobTitleController = TextEditingController(text: widget.user.jobTitle);
    _bioController = TextEditingController(text: widget.user.bio);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobTitleController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      // بنبني نسخة محدثة من الـ user بالقيم الجديدة
      final updatedUser = UserModel(
        name: _nameController.text.trim(),
        jobTitle: _jobTitleController.text.trim(),
        email: widget.user.email, // ما بيتعدل من هاي الشاشة
        phone: widget.user.phone, // ما بيتعدل من هاي الشاشة
        bio: _bioController.text.trim(),
      );

      // منرجع للشاشة يلي قبل، ومعنا الـ user المحدث
      Navigator.pop(context, updatedUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.deepPurple.shade100,
                        child: Text(
                          widget.user.initials,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                _buildLabel('Name'),
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                _buildLabel('Job title'),
                TextFormField(
                  controller: _jobTitleController,
                  decoration: _inputDecoration(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Job title is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                _buildLabel('Bio'),
                TextFormField(
                  controller: _bioController,
                  maxLines: 3,
                  decoration: _inputDecoration(),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _handleSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Save changes',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    );
  }
}
