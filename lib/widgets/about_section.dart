// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/constants/constant.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> featureCards = [
      _buildFeatureCard(
        icon: Icons.code,
        title: Constants().userProfile.aboutDescriptionList[0].header,
        description:
            Constants().userProfile.aboutDescriptionList[0].description,
      ),
      _buildFeatureCard(
        icon: Icons.phone_iphone,
        title: Constants().userProfile.aboutDescriptionList[1].header,
        description:
            Constants().userProfile.aboutDescriptionList[1].description,
      ),
      _buildFeatureCard(
        icon: Icons.bolt_outlined,
        title: Constants().userProfile.aboutDescriptionList[2].header,
        description:
            Constants().userProfile.aboutDescriptionList[2].description,
      ),
      _buildFeatureCard(
        icon: Icons.layers_outlined,
        title: Constants().userProfile.aboutDescriptionList[3].header,
        description:
            Constants().userProfile.aboutDescriptionList[3].description,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 75.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Constants().aboutMeText,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: isMobile ? 10 : 16.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 0 : constraints.maxWidth * 0.15,
                ),
                child: Text(
                  Constants().userProfile.aboutHeaderDiscription,
                  style: const TextStyle(fontSize: 16.0, height: 1.6),
                  textAlign:
                      TextAlign.center, // Added for better mobile readability
                ),
              ),
              SizedBox(height: isMobile ? 25 : 40.0),
              constraints.maxWidth < 1000
                  ? constraints.maxWidth < 550
                        ? Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  children: [Expanded(child: featureCards[0])],
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              IntrinsicHeight(
                                child: Row(
                                  children: [Expanded(child: featureCards[1])],
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              IntrinsicHeight(
                                child: Row(
                                  children: [Expanded(child: featureCards[2])],
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ), // Spacing between rows
                              IntrinsicHeight(
                                child: Row(
                                  children: [Expanded(child: featureCards[3])],
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Expanded(child: featureCards[0]),
                                    const SizedBox(width: 16.0),
                                    Expanded(child: featureCards[1]),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ), // Spacing between rows
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Expanded(child: featureCards[2]),
                                    const SizedBox(width: 16.0),
                                    Expanded(child: featureCards[3]),
                                  ],
                                ),
                              ),
                            ],
                          )
                  : IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          featureCards[0],
                          const SizedBox(width: 16.0),
                          featureCards[1],
                          const SizedBox(width: 16.0),
                          featureCards[2],
                          const SizedBox(width: 16.0),
                          featureCards[3],
                        ],
                      ),
                    ),
              SizedBox(height: isMobile ? 20 : 40.0),
              _buildJourneyHighlights(constraints),
              SizedBox(height: isMobile ? 20 : 40.0),
            ],
          ),
        );
      },
    );
  }

  Widget _buildJourneyHighlights(BoxConstraints constraints) {
    final bool isMobile = constraints.maxWidth < 900;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 20.0 : 28.0,
          horizontal: isMobile ? 20.0 : 28.0,
        ),
        child: Column(
          crossAxisAlignment: isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              "My Journey",
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            isMobile
                ? Column(
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      // Left descriptive column
                      journeyDescriptionText(isMobile),

                      // Right stats column
                      SizedBox(height: isMobile ? 20.0 : 32.0),
                      experienceYearCountWidget(isMobile),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left descriptive column
                      Expanded(
                        flex: 3,
                        child: journeyDescriptionText(isMobile),
                      ),

                      // Right stats column
                      SizedBox(width: isMobile ? 12.0 : 32.0),
                      Expanded(
                        flex: 2,
                        child: experienceYearCountWidget(isMobile),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Column experienceYearCountWidget(bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        _statItem(
          value: '${Constants().userProfile.mobileExperienceCount}+',
          title: 'Years Experience',
          subtitle: 'In mobile development',
        ),
        SizedBox(height: isMobile ? 12.0 : 18.0),
        _statItem(
          value: '${Constants().userProfile.totalProjects}+',
          title: 'Projects Completed',
          subtitle: 'Across various industries',
        ),
      ],
    );
  }

  Column journeyDescriptionText(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12.0),
        Text(
          Constants().userProfile.journey,
          style: const TextStyle(fontSize: 14.5, height: 1.6),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }

  Widget _statItem({
    required String value,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppConstant().themeColor.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(
              color: AppConstant().themeColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Expanded(
      // Changed to Expanded for consistent width in Row
      child: Card(
        child: Padding(
          // Simplified from Container to Padding for brevity
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Ensures centered content
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppConstant().themeColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 34, color: AppConstant().themeColor),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                ), // Slightly smaller for mobile fit
              ),
            ],
          ),
        ),
      ),
    );
  }
}
