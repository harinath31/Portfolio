import 'package:flutter/material.dart';
import 'package:portfolio/model/education.dart';
import 'package:portfolio/model/experience.dart';
import 'package:portfolio/model/social_media.dart';
import 'package:portfolio/model/user_profile.dart';

class Constants {
  final String aboutMeText = "About Me";

  final UserProfile userProfile = UserProfile(
    name: 'Harinath G',
    profileImage: 'assets/images/profile.jpg',
    email: "harinathg1999@gmail.com",
    role: "Flutter Developer",
    introHeader: "Building innovative solutions with Flutter.",
    introDiscription:
        '''I'm a Flutter developer with 3+ years of experience. I have a passion for creating clean, efficient code and finding innovative solutions to complex problems.''',
    aboutHeaderDiscription:
        '''I'm a Flutter developer with a degree 3+ years of experience. I have experience working with a variety of technologies, including HTML, CSS, JavaScript, angular, Flutter, and blazor. I specialize in creating clean, efficient code and finding innovative solutions to complex problems.''',
    aboutDescriptionList: [
      AboutDescriptionModel(
        icon: Icons.code,
        header: 'Clean Code',
        description:
            'I write clean, maintainable code following best practices and design patterns.',
      ),
      AboutDescriptionModel(
        icon: Icons.phone_iphone,
        header: 'Responsive Design',
        description:
            'Creating interfaces that work flawlessly across all device sizes and orientations.',
      ),
      AboutDescriptionModel(
        icon: Icons.bolt_outlined,
        header: 'Performance Focused',
        description:
            'Building high-performance apps with smooth animations and efficient resource usage.',
      ),
      AboutDescriptionModel(
        icon: Icons.layers_outlined,
        header: 'Architecture',
        description:
            'Implementing scalable architectures like BLoC, Provider, and GetX for maintainable apps.',
      ),
    ],
    journeySubHeader: 'My Journey So Far',
    journey:
        'I have experience working with a variety of technologies, including HTML, CSS, JavaScript, Angular, and Flutter. In my current role as a Flutter Developer at Syncfusion Software, I lead the development of cross-platform applications using Flutter, ensuring high-quality deliverables across platforms.',
    mobileExperienceCount: 3,
    totalProjects: 10,
    socialMediaList: [
      SocialMedia(
        name: 'gmail',
        asset: 'assets/images/gmail.png',
        url: 'https://www.linkedin.com/in/harinath-g-363295233/', // update
        size: 27,
      ),

      SocialMedia(
        name: 'GitHub',
        asset: 'assets/images/github-mark.png',
        url: 'https://github.com/harinath31', // update
        size: 25,
      ),
      SocialMedia(
        name: 'LinkedIn',
        asset: 'assets/images/LI-In-Bug.png',
        url: 'https://www.linkedin.com/in/harinath-g-363295233/', // update
        size: 27,
      ),
      // add more SocialMedia(...) entries here
    ],
    educationList: [
      Education(
        degree: 'Full Stack Development Course',
        subtitle: 'Qspiders, Chennai',
        duration: '12/2021 – 04/2022',
      ),
      Education(
        degree: 'Bachelor of Engineering (Mechanical Engineering)',
        subtitle: 'Rajalakshmi Institute of Technology, Chennai',
        duration: '06/2016 – 05/2020',
      ),
      Education(
        degree: 'XII Standard (Computer Science)',
        subtitle:
            'Vidya Mandir Matriculation Higher Secondary School, Namakkal',
        duration: '06/2014 – 05/2016',
      ),
      Education(
        degree: 'X Standard',
        subtitle:
            'Vidyaa Vikas Matriculation Higher Secondary School, Tiruchengode',
        duration: '06/2014 – 05/2016',
      ),
    ],
    experienceList: [
      Experience(
        title: 'Software Engineer level 3',
        subtitle: 'Syncfusion Software Pvt Ltd, Chennai',
        duration: '05/2022 – Present',
        bulletPoints: [
          'Developed and optimized cross-platform mobile applications using Flutter and Dart, delivering seamless performance across iOS and Android platforms.',
          'Implemented RESTful API integrations, Bloc state management, and push notifications for real-time, interactive user experiences.',
          'Improved UI/UX designs, ensured responsive layouts, and optimized app performance through structured, scalable architecture.',
          'Contributed to Bold Desk – Ticket Management System, enhancing modules for ticket handling, activity tracking, and real-time chat to ensure smooth synchronization across devices.',
          'Built an IT Asset Management demo using Essential JS 2 Angular components, enabling efficient asset linking, user profile integration, and CRUD operations.',
          'Ensured adherence to Agile methodologies, focusing on continuous improvement, and maintainable code practices.',
        ],
      ),
    ],
    skills: [
    'Dart',
    'Flutter',
    'Angular',
    'JavaScript',
    'TypeScript',
    'HTML',
    'CSS',
    'Blazor',
    'RESTful API',
    'Git',
    'Agile',
    'Unit Testing',
    'Bloc',
    'SQL',
    'LINQ',
    "Websocket",
    'Firebase (Basic)',
  ]
  );
}
