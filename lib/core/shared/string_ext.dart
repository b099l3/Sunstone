extension StringExtension on String {
  String capitalise() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
