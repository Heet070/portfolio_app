import 'package:portfolio/models/dev_models.dart';

/// Custom Class for storing Developer Data locally
class DevData {
  DevData._();

  static DevModel devData = DevModel(
    name: "Heet Shah",
    bio: devBio,
    skillsAndProgress: <SkillsData>[
      SkillsData(
        name: 'DSA',
      ),
      SkillsData(
        name: 'CP',
      ),
      SkillsData(
        name: 'Flutter',
      ),
    ],
    hobbies: <String>[
      "Learning about Development",
      "Create YouTube Content",
      "Plying COD",
    ],
    number: '+91 78610 11056',
    mail: 'heet52858@gmail.com',
    linkedIn: 'https://www.linkedin.com/in/heet-shah-b824522b1',
    leetCode: 'https://leetcode.com/heet52858',
    gitHub: 'https://github.com/Heet070',
    codeforces: 'https://codeforces.com/profile/heet070',
    education: {
      '10th Percentage': 'ZSE Vejalpur - 93.8%',
      '12th Percentage': 'ZSE Vejalpur - 94.2%',
      'JEE Mains Rank': 'AIR 17324',
      'Current CPI': '7.78',
      'College': 'DA-IICT \' 27',
    },
    funFact: "I once built a complete portfolio app in under 24 hours using only Flutter and coffee ☕!",
  );

  static const String devBio = """
I'm Heet, a motivated software engineering student with a passion for mobile development using Dart and Flutter 📱.I am also enthusiastic towards competitive programming and always keen to learn new stuff and face any challenge across and I am also a gym freak😜"
""";
}