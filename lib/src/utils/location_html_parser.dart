import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parse;



Widget locationHtmlParser(data) {
  var document = parse(data);
  var dt = Html(
    data: document.outerHtml,
  );
  return dt;
}
