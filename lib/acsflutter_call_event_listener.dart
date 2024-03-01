class AcsFlutterEventListener {
  /// Called when status from call chaned.
  ///
  /// [status] the new call status
  final Function(String status)? statusChanged;

  AcsFlutterEventListener(
      {this.statusChanged}
      );
}
