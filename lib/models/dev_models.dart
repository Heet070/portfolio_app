/// Developer model class
class DevModel {
  final String name;
  final String number;
  final String mail;
  final String bio;
  final List<SkillsData> skillsAndProgress;
  final List<String> hobbies;
  final String linkedIn;
  final String leetCode;
  final String codeforces;
  final String gitHub;
  final Map<String, String> education;

  final String funFact;

  DevModel({
    required this.number,
    required this.mail,
    required this.name,
    required this.bio,
    required this.skillsAndProgress,
    required this.hobbies,
    required this.linkedIn,
    required this.leetCode,
    required this.codeforces,
    required this.education,
    required this.funFact,
    required this.gitHub,
  });
}

/// Skills model class
class SkillsData {
  final String name;
  SkillsData({
    required this.name,
  });
}

