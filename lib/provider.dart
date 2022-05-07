import 'package:qurancompetition/DATA.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class providerdata with ChangeNotifier {
  providerdata() {
    //data.shuffle();

    ((data.elementAt(0) as Map)['list'] as List).shuffle();
    ((data.elementAt(1) as Map)['list'] as List).shuffle();
    ((data.elementAt(2) as Map)['list'] as List).shuffle();
    ((data.elementAt(3) as Map)['list'] as List).shuffle();
    ((data.elementAt(4) as Map)['list'] as List).shuffle();
  }

  List data = DUMMY_CATEGORIES;
  int userId = -1;
}
