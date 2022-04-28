import 'package:qurancompetition/DATA.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class providerdata with ChangeNotifier {
  List data = DUMMY_CATEGORIES;

  int userId = -1;
}
