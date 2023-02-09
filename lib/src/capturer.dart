import 'package:flutter/material.dart';
import 'package:statusbarz/statusbarz.dart';

class StatusbarzCapturer extends StatelessWidget {
  final Widget child;
  final StatusbarzTheme? theme;

  /// This must be placed above MaterialApp for Statusbarz to work.
  /// ```dart
  /// void main() {
  ///   runApp(
  ///     StatusbarzCapturer(
  ///       child: MaterialApp(
  ///         navigatorObservers: [Statusbarz.instance.observer],
  ///         home: Container(),
  ///       ),
  ///     ),
  ///   );
  /// }
  /// ```
  ///  * [Statusbarz], the interface for manually refreshing status bar color
  ///  * [StatusbarzObserver], the observer used to listen to route changes and automatically refresh status bar color
  const StatusbarzCapturer({
    Key? key,
    required this.child,
    this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (theme != null) Statusbarz.instance.setTheme(theme!);
    return RepaintBoundary(
      key: Statusbarz.instance.key,
      child: child,
    );
  }
}
