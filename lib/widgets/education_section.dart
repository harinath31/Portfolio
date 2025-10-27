import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/constants/constant.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEducationCard();
  }

  Widget _buildEducationCard() {
    final educations = Constants().userProfile.educationList;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 75.0),
          child: Column(
            children: [
              if (isMobile)
                Icon(Icons.school, size: 50, color: AppConstant().themeColor),
              Text(
                "Education",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 4.0),
              Text(
                "Here is a brief overview of my educational background.",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 20.0 : 30.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...educations.map((education) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: isMobile ? 4 : 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: isMobile
                                    ? null
                                    : CircleAvatar(
                                        backgroundColor:
                                            AppConstant().themeColor,
                                        child: const Icon(
                                          Icons.school,
                                          color: Colors.white,
                                        ),
                                      ),
                                title: Text(
                                  education.degree,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(education.subtitle),
                                trailing: isMobile
                                    ? null
                                    : Text(education.duration),
                              ),
                              if (isMobile)
                                Text(
                                  education.duration,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              if (isMobile) SizedBox(height: 8.0),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
