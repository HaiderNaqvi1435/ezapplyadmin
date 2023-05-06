import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

Widget viewMore(String details) {
  ScrollController scrollController = ScrollController();
  QuillController quillController = QuillController(
      document: Document.fromJson(jsonDecode(details)),
      selection: TextSelection.collapsed(offset: 0));
  return Dialog(
    child: QuillEditor(
      padding: EdgeInsets.zero,
      autoFocus: false,
      scrollable: true,
      expands: true,
      showCursor: false,
      scrollController: scrollController,
      focusNode: FocusNode(),
      controller: quillController,
      readOnly: true,
    ),
  );
}
