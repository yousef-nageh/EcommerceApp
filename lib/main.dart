
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shop_app/app/classes/cache_helper.dart';
import 'package:shop_app/app/functions/dependency_injection.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
 setup();
  runApp(Phoenix(child: const MyApp()));
}

