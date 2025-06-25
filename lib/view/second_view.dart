import 'package:flutter/material.dart';
import 'package:portfolio/data/dev_data.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widget/contact_card.dart';

class SecondView extends StatefulWidget {
  const SecondView({super.key});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bioOpacity;
  late Animation<double> _hobbiesOpacity;
  late Animation<double> _contactOpacity;
  late Animation<double> _extraOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    _bioOpacity = _fadeAnimation(0.0, 0.3);
    _hobbiesOpacity = _fadeAnimation(0.3, 0.6);
    _contactOpacity = _fadeAnimation(0.6, 0.85);
    _extraOpacity = _fadeAnimation(0.85, 1.0);

    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.forward());
  }

  Animation<double> _fadeAnimation(double start, double end) {
    return Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Interval(start, end)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget animatedSection({required Animation<double> animation, required Widget child}) {
    return FadeTransition(opacity: animation, child: child);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return SafeArea(
      child: CustomScrollView(
        physics: const PageScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
                horizontal: size.width * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  animatedSection(
                    animation: _bioOpacity,
                    child: _buildBioCard(theme),
                  ),
                  SizedBox(height: size.height * 0.015),
                  animatedSection(
                    animation: _hobbiesOpacity,
                    child: _buildHobbiesCard(theme),
                  ),
                  SizedBox(height: size.height * 0.015),
                  animatedSection(
                    animation: _contactOpacity,
                    child: _buildContactCard(theme),
                  ),
                  SizedBox(height: size.height * 0.015),
                  animatedSection(
                    animation: _extraOpacity,
                    child: _buildExtraCard(theme),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioCard(ThemeData theme) {
    return _cardWrapper(
      children: [
        Text(AppStrings.secondScreenBio, style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15)),
        const SizedBox(height: 6),
        Text(
          DevData.devBio,
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
        ),
      ],
    );
  }

  Widget _buildHobbiesCard(ThemeData theme) {
    return _cardWrapper(
      children: [
        Text(AppStrings.secondScreenHobbies, style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15)),
        const SizedBox(height: 6),
        ...List.generate(
          DevData.devData.hobbies.length,
          (index) => Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "${index+1}. ${DevData.devData.hobbies[index]}",
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard(ThemeData theme) {
    return _cardWrapper(
      children: [
        Text(AppStrings.secondScreenContact, style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15)),
        const SizedBox(height: 6),
        ContactCard(title: DevData.devData.number, icon: Icons.phone),
        ContactCard(title: DevData.devData.mail, icon: Icons.mail),
        ContactCard(
          title: "LinkedIn Profile",
          icon: Icons.link,
          linkedIn: DevData.devData.linkedIn,
        ),
      ],
    );
  }

  Widget _buildExtraCard(ThemeData theme) {
    return _cardWrapper(
      children: [
        Text("Fun Fact", style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15)),
        const SizedBox(height: 6),
        Text(
          DevData.devData.funFact,
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
        ),
      ],
    );
  }

  Widget _cardWrapper({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
