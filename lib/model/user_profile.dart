import 'package:flutter/material.dart';
import 'package:portfolio/model/education.dart';
import 'package:portfolio/model/experience.dart';
import 'package:portfolio/model/social_media.dart';

class UserProfile {
  final String name;
  final String profileImage;
  final String? email;
  final String role;
  final String introHeader;
  final String introDiscription;
  final String aboutHeaderDiscription;
  final List<AboutDescriptionModel> aboutDescriptionList;
  final String journey;
  final String journeySubHeader;
  final int mobileExperienceCount;
  final int totalProjects;
  final List<Education> educationList;
  final List<Experience> experienceList;
  final List<SocialMedia> socialMediaList;
  final List<String> skills;
  UserProfile({
    required this.name,
    required this.profileImage,
    required this.email,
    required this.role,
    required this.introHeader,
    required this.introDiscription,
    required this.aboutHeaderDiscription,
    required this.aboutDescriptionList,
    required this.journey,
    required this.journeySubHeader,
    required this.mobileExperienceCount,
    required this.totalProjects,
    required this.educationList,
    required this.experienceList,
    required this.socialMediaList,
    required this.skills,
  });
}

class AboutDescriptionModel {
  final IconData icon;
  final String header;
  final String description;

  AboutDescriptionModel({
    required this.header,
    required this.description,
    required this.icon,
  });
}
