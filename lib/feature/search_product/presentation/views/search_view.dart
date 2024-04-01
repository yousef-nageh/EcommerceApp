import 'package:flutter/material.dart';

import '../../../../app/widget/back_icon.dart';
import '../widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent, leading: const BackIcon()),
      body: const SearchViewBody(),
    );
  }
}
