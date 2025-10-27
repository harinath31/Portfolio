import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/constants/constant.dart';

// If AppConstant is defined in another file, add the appropriate import.
// import 'package:your_app/app_constant.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // final title = AppConstant().skillsTitle;
    final skills = Constants().userProfile.skills;
    final themeColor = AppConstant().themeColor;
    final icon = Icons.code;

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
                textAlign: TextAlign.center,
                "Skills & Technologies",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 4.0),
              Text(
                "Here is a brief overview of my skills and technologies I work with.",
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
                      Row(
                        children: [
                          // Text(
                          //   title,
                          //   style: TextStyle(
                          //     fontSize: 22,
                          //     fontWeight: FontWeight.bold,
                          //     color: themeColor,
                          //   ),
                          // ),
                          const Spacer(),
                          Icon(icon, color: themeColor, size: 40),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 18,
                        runSpacing: 18,
                        children: skills
                            .map(
                              (skill) => Chip(
                                label: Text(skill),
                                backgroundColor: Colors.grey[100],
                                side: BorderSide(color: themeColor, width: 1),
                              ),
                            )
                            .toList(),
                      ),
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
