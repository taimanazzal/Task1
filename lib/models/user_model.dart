class UserModel {
  String name;
  String jobTitle;
  String email;
  String phone;
  String bio;

  UserModel({
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.phone,
    required this.bio,
  });

  // بيرجع الحروف الأولى من الاسم لعرضها بالـ Avatar (زي "AM")
  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}
