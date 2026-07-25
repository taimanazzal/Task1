import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<UserModel> team = [
      UserModel(
        name: 'Ahmed Mahmoud',
        jobTitle: 'Flutter Developer',
        email: 'ahmed@example.com',
        phone: '+20 100 123 4567',
        bio: 'Mobile developer passionate about clean design',
      ),
      UserModel(
        name: 'Sara Ali',
        jobTitle: 'UI/UX Designer',
        email: 'sara@example.com',
        phone: '+20 101 234 5678',
        bio: 'Designs simple, human-centered interfaces',
      ),
      UserModel(
        name: 'Karim Hassan',
        jobTitle: 'Backend Engineer',
        email: 'karim@example.com',
        phone: '+20 102 345 6789',
        bio: 'Builds reliable and scalable APIs',
      ),
    ];

    // كل عضو بالفريق بنعطيه لون مختلف للـ avatar
    final List<Color> avatarColors = [
      Colors.deepPurple.shade100,
      Colors.pink.shade100,
      Colors.teal.shade100,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: team.length,
        itemBuilder: (context, index) {
          final user = team[index];
          final color = avatarColors[index % avatarColors.length];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: color,
                radius: 22,
                child: Text(
                  user.initials,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(user.jobTitle),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // منمرر الـ user object نفسه كـ argument للصفحة الجاية
                Navigator.pushNamed(context, '/profile', arguments: user);
              },
            ),
          );
        },
      ),
    );
  }
}
