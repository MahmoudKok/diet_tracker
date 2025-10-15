extension WebViewExtension on String {
  String get stripHtmlIfNeeded => replaceAll(
    "<br>",
    "\n",
  ).replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ').trim();
}
