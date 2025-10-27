import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/constants/constant.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 75.0),
          child: Column(
            children: [
              if (isMobile)
                Icon(Icons.work, size: 40, color: AppConstant().themeColor),
              Text(
                "Experience",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 4.0),
              Text(
                "Here is a brief description of my professional experience.",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 20.0 : 30.0),
              _buildExperienceCard(isMobileView: isMobile),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExperienceCard({bool isMobileView = true}) {
    final experiences = Constants().userProfile.experienceList;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...experiences.map((experience) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: isMobileView
                          ? null
                          : CircleAvatar(
                              backgroundColor: AppConstant().themeColor,
                              child: const Icon(
                                Icons.work,
                                color: Colors.white,
                              ),
                            ),
                      title: Text(
                        experience.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      subtitle: Text(
                        experience.subtitle,
                        style: TextStyle(fontSize: 15, height: 1.5),
                      ),
                      trailing: isMobileView
                          ? null
                          : Text(
                              experience.duration,
                              style: TextStyle(fontSize: 15, height: 1.5),
                            ),
                    ),
                    if (isMobileView)
                      Text(
                        experience.duration,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (isMobileView) SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(left: isMobileView ? 10 : 56.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var point in experience.bulletPoints)
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text("•"),
                                  ),
                                  Flexible(
                                    child: Text(
                                      point,
                                      style: TextStyle(
                                        fontSize: 15,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
