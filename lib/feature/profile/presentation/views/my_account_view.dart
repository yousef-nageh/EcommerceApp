import 'package:flutter/material.dart';

import '../../../../app/widget/back_icon.dart';
import '../widgets/my_account_view_body.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const BackIcon()
      ),
      body: const MyAccountViewBody(),
    );
  }
}
