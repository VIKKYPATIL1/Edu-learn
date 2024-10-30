// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:universal_html/html.dart' as html;

Future<void> downloadFromUrl(String url) async {
  // Create an anchor element for downloading
  final anchor = html.AnchorElement(href: url)
    ..target = 'webdownload'
    ..download = "fileName"; // Specify the desired file name

  // Trigger a click event on the anchor to initiate the download
  anchor.click();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
