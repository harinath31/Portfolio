// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/constants/constant.dart';
import 'package:portfolio/main.dart';

class IntroSection extends StatelessWidget {
  final Function() viewWork;
  final Function() viewContact;
  const IntroSection({
    required this.viewWork,
    required this.viewContact,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNotPhone = constraints.maxWidth > 900;
          return isNotPhone
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 5, child: aboutWidget(isNotPhone)),
                    Expanded(flex: 5, child: profileWidget(isNotPhone)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profileWidget(isNotPhone),
                    SizedBox(height: 30),
                    aboutWidget(isNotPhone),
                  ],
                );
        },
      ),
    );
  }

  Align profileWidget(bool isNotPhone) {
    return Align(
      alignment: isNotPhone ? Alignment.centerRight : Alignment.center,
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppConstant().themeColor.withOpacity(0.24),
            width: 6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
          image: const DecorationImage(
            image: AssetImage('assets/images/HarinathG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Column aboutWidget(bool isNotPhone) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // small tag
        SizedBox(height: isNotPhone ? 20 : 18),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: AppConstant().themeColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Flutter Developer',
            style: TextStyle(
              color: AppConstant().themeColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: isNotPhone ? 40 : 18),
        SizedBox(
          width: 600,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: isNotPhone ? 56 : 36,
                height: 1.02,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
              children: _buildHeadlineSpans(
                Constants().userProfile.introHeader,
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          child: Text(
            Constants().userProfile.introDiscription,
            style: TextStyle(fontSize: 18, height: 1.6, color: Colors.black54),
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            ElevatedButton.icon(
              onPressed: viewWork,
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              label: const Text(
                'View My Work',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 18,
                ),
                shape: const StadiumBorder(),
                backgroundColor: AppConstant().themeColor,
              ),
            ),
            OutlinedButton(
              onPressed: viewContact,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 18,
                ),
                shape: const StadiumBorder(),
                side: BorderSide(color: Colors.black12),
                foregroundColor: Colors.black87,
              ),
              child: const Text('Contact Me'),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            ...Constants().userProfile.socialMediaList.map(
              (s) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () => launchURL(s.url, s.name),
                  child: Image.asset(
                    s.asset,
                    width: s.size.toDouble(),
                    height: s.size.toDouble(),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<TextSpan> _buildHeadlineSpans(String headline) {
    final theme = AppConstant().themeColor;
    final keywords = ['innovative', 'solutions'];
    final parts = headline.split(' ');
    return parts.map<TextSpan>((word) {
      final clean = word.replaceAll(RegExp(r'[^\w]'), '');
      if (keywords.contains(clean.toLowerCase())) {
        return TextSpan(
          text: '$word ',
          style: TextStyle(color: theme, fontWeight: FontWeight.w900),
        );
      } else {
        return TextSpan(text: '$word ');
      }
    }).toList();
  }
}
