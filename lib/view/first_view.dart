import 'package:flutter/material.dart';
import 'package:portfolio/data/dev_data.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widget/skills_box.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    final dev = DevData.devData;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.06),

          /// Smaller Avatar
          Container(
            padding: EdgeInsets.all(size.height * .008),
            decoration: BoxDecoration(
              color: theme.cardColor,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: size.height * .10, // Reduced from .15
              backgroundColor: AppColors.appPrimaryColor,
              backgroundImage: NetworkImage(AppStrings.profileImageUrl),
            ),
          ),

          const SizedBox(height: 10),

          /// Name with smaller font
          
          /// Name and College
          Column(
            children: [
              Text(
                dev.name,
                style: theme.textTheme.displayLarge?.copyWith(fontSize: 26),
              ),
              const SizedBox(height: 4),
              Text(
                DevData.devData.education['College'] ?? "", // Safely fetch college name
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.hintColor,
                ),
              ),
            ],
          ),


          const SizedBox(height: 16),

          /// Skills
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              dev.skillsAndProgress.length,
              (index) => SkillBox(
                text: dev.skillsAndProgress[index].name,
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// Coding Profiles
          _cardWrapper(
            theme,
            "Coding Profiles",
            children: [
              _linkText("LeetCode", dev.leetCode),
              _linkText("Codeforces", dev.codeforces),
              _linkText("GitHub", dev.gitHub),
            ],
          ),

          /// Education
          _cardWrapper(
            theme,
            "Education",
            children: dev.education.entries
                .map((entry) => _eduRow(entry.key, entry.value))
                .toList(),
          ),

          SizedBox(height: size.height * 0.04),
        ],
      ),
    );
  }

  Widget _linkText(String label, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          "• $label",
          style: TextStyle(
            fontSize: 15,
            color: AppColors.appPrimaryColor,
            //decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _eduRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _cardWrapper(ThemeData theme, String title, {required List<Widget> children}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}
