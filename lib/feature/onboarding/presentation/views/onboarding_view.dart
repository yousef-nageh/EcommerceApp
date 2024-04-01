import 'package:flutter/material.dart';

import '../widget/onboarding_view_body.dart';
import '../widget/skip_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SkipButton()),
      body: const OnboardingViewBody(),
    );
  }
}
