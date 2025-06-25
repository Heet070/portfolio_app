import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.title,
    required this.icon,
    this.linkedIn,
  });

  final String title;
  final IconData icon;
  final String? linkedIn;

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: size.width * 0.01,
        ),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.01),

            Icon(
              icon,
              color: theme.canvasColor,
              size: 30,
            ),

            SizedBox(width: size.width * 0.1),

            linkedIn == null
                ? Text(
                    title,
                    style: theme.textTheme.bodyMedium,
                  )
                : GestureDetector(
                    onTap: () => _launchURL(linkedIn!),
                    child: Text(
                      title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
