// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/constants/constant.dart';
import '../main.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final social = Constants().userProfile.socialMediaList;
    final year = DateTime.now().year;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        color: AppConstant().themeColor.withOpacity(0.1),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isPhone = constraints.maxWidth < 600;
          final titleStyle = TextStyle(
            color: AppConstant().themeColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          );
          final subtitleStyle = TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          );
          final copyrightStyle = TextStyle(
            color: Colors.grey[600],
            fontSize: 13,
          );

          Widget left = Column(
            crossAxisAlignment: isPhone
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text('FlutterDev', style: titleStyle),
              const SizedBox(height: 6),
              Text(
                'Building beautiful mobile experiences with Flutter',
                style: subtitleStyle,
              ),
            ],
          );

          Widget right = Column(
            crossAxisAlignment: isPhone
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: social.map((s) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: GestureDetector(
                      onTap: () => launchURL(s.url, s.name),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(                         
                          image: DecorationImage(
                            image: AssetImage(s.asset),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              Text(
                '© $year Harinath G. All rights reserved.',
                style: copyrightStyle,
              ),
            ],
          );

          if (isPhone) {
            return Column(
              children: [left, const SizedBox(height: 16), right],
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [left, right],
            );
          }
        },
      ),
    );
  }
}
