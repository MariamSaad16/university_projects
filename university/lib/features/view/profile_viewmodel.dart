import 'package:flutter/foundation.dart';
import '../model/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileModel profile = const ProfileModel(
    name: 'Mariam saad',
    jobTitle: 'Flutter Developer',
    email: 'mariam@example.com',
    location: 'Cairo, Egypt',
    phone: '+201023719469',
    aboutMe:
        'Computer Science graduate passionate about mobile apps '
        'and Flutter development.',
    portfolioUrl: 'https://example.com/portfolio',
  );

  String get name => profile.name;
  String get jobTitle => profile.jobTitle;
  String get email => profile.email;
  String get location => profile.location;
  String get phone => profile.phone;
  String get aboutMe => profile.aboutMe;
  String get portfolioUrl => profile.portfolioUrl;
}