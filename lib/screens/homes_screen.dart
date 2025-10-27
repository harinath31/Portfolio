import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/widgets/about_section.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/education_section.dart';
import 'package:portfolio/widgets/skills_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widgets/experience_section.dart';
import '../widgets/footer.dart';
import '../widgets/intro_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemScrollController? itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _scrollToSection(int index) async {
    await itemScrollController?.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildSection(int index, bool isPhone) {
    const horizontalPadding = 80.0;
    const mobileHorizontalPadding = 25.0;
    const topPadding = 60.0;
    const bottomPadding = 100.0;

    final hPadding = EdgeInsets.symmetric(
      horizontal: isPhone ? mobileHorizontalPadding : horizontalPadding,
    );

    switch (index) {
      case 0:
        return Padding(
          padding: EdgeInsets.only(
            left: isPhone ? mobileHorizontalPadding : horizontalPadding,
            top: topPadding,
            right: isPhone ? mobileHorizontalPadding : horizontalPadding,
            bottom: bottomPadding,
          ),
          child: IntroSection(
            viewWork: () => _scrollToSection(2),
            viewContact: () => _scrollToSection(5),
          ),
        );
      case 1:
        return Container(
          padding: hPadding,
          color: AppConstant().secondaryBackgroundColor,
          child: const AboutSection(),
        );
      case 2:
        return Padding(padding: hPadding, child: const ExperienceSection());
      case 3:
        return Container(
          padding: hPadding,
          color: AppConstant().secondaryBackgroundColor,
          child: const EducationSection(),
        );
      case 4:
        return Padding(padding: hPadding, child: const SkillsCard());
      case 5:
        return Container(
          padding: hPadding,
          color: AppConstant().secondaryBackgroundColor,
          child: const ContactSection(),
        );
      case 6:
        return const Footer();
      default:
        return const SizedBox.shrink();
    }
  }

  List<Widget> _buildAppBarActions(bool isPhone) {
    if (!isPhone) {
      return [
        _buildNavButton('Home', 0),
        const SizedBox(width: 8),
        _buildNavButton('About', 1),
        const SizedBox(width: 8),
        _buildNavButton('Experience', 2),
        const SizedBox(width: 8),
        _buildNavButton('Education', 3),
        const SizedBox(width: 8),
        _buildNavButton('Skills', 4),
        const SizedBox(width: 8),
        _buildNavButton('Contact', 5),
        const SizedBox(width: 80),
      ];
    } else {
      return [
        Padding(
          padding: const EdgeInsets.only(right: 13.0),
          child: PopupMenuButton<int>(
            icon: Icon(Icons.menu, color: AppConstant().themeColor, size: 28),
            offset: const Offset(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
            color: Colors.white,
            onSelected: _scrollToSection,
            itemBuilder: (context) => [
              _buildPopupMenuItem(Icons.home, 'Home', 0),
              _buildPopupMenuItem(Icons.person_outline, 'About', 1),
              _buildPopupMenuItem(Icons.work_outline, 'Experience', 2),
              _buildPopupMenuItem(Icons.school_outlined, 'Education', 3),
              _buildPopupMenuItem(Icons.code, 'Skills', 4),
              _buildPopupMenuItem(Icons.contact_mail_outlined, 'Contact', 5),
            ],
          ),
        ),
      ];
    }
  }

  Widget _buildNavButton(String label, int index) {
    return TextButton(
      onPressed: () => _scrollToSection(index),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(
    IconData icon,
    String label,
    int value,
  ) {
    return PopupMenuItem<int>(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: AppConstant().themeColor),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPhone = constraints.maxWidth < 900;
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: isPhone ? 56 : 70,
            title: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isPhone ? 13 : 68.0,
                vertical: isPhone ? 0 : 16.0,
              ),
              child: Text(
                'Harinath G',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppConstant().themeColor, // Assuming this is defined
                ),
              ),
            ),
            actions: _buildAppBarActions(isPhone),
          ),
          body: ScrollablePositionedList.builder(
            key: const Key("scroll_list"),
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemCount: 7,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => _buildSection(index, isPhone),
            physics: const ScrollPhysics(),
          ),
        );
      },
    );
  }
}
