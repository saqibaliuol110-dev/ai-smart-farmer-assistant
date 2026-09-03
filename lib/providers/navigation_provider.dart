import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks the active index of the BottomNavigationBar.
final navigationIndexProvider = NotifierProvider<NavigationIndex, int>(NavigationIndex.new);

class NavigationIndex extends Notifier<int> {
  @override
  int build() => 0;

  set index(int val) => state = val;
}

