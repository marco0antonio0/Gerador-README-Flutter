import 'package:flutter/material.dart';

import '../view/page_1.dart';

class Backend {
  Backend._();
  static final Backend instance = Backend._();
  //====================================================
  List<Map<String, dynamic>> dados = [
    {'id': 0, 'type': 'H1', 'args': '', 'args2': '', 'widget': ListBTN(0)}
  ];
  //====================================================
  int itemCount = 1;
  //====================================================
  var setState;
  var setState_2;
  //====================================================
  // n
  gerar() {
    String text = '';
    String args2 = '';
    for (var i = 0; i < dados.length; i++) {
      if (dados[i]['args'].length > 0 && dados[i]['type'] != 'delete') {
        text += fn_typeFormat(
            dados[i]['type'], dados[i]['args'], dados[i]['args2']);
      }
    }
    return text;
  }

  fn_typeFormat(type, args, args2) {
    var y = '';
    if (type == "H1") y = "# $args\n";
    //====================================================
    if (type == "H2") y = "## $args\n";
    //====================================================
    if (type == "H3") y = "### $args\n";
    //====================================================
    if (type == "code") y = '''```\n$args\n```<br>\n''';
    //====================================================
    if (type == "Text") y = "<span>$args <br><\span>\n";
    //====================================================
    if (type == "Image") y = "![img]($args) <br>\n";
    //====================================================
    if (type == "Buttom Image")
      y = '<a href="https://$args2"><img src="$args" alt="drawing" width="40%" height="auto"><a><br>\n';
    //====================================================
    if (type == "Buttom Download")
      y = '<a href="https://$args"><img src="https://github.com/marco0antonio0/Gerador-README-Flutter/blob/e6b48f8f422605559cebc4da02aeae6037972dd8/repositorio_images/BTN_Download.png" alt="drawing" width="30%" height="auto"><a><br>\n';
    //====================================================
    if (type == "Buttom ferramenta")
      y = '<a href="https://$args"><img src="https://github.com/marco0antonio0/Gerador-README-Flutter/blob/e6b48f8f422605559cebc4da02aeae6037972dd8/repositorio_images/BTN_acesse_a_ferramenta.png" alt="drawing" width="45%" height="auto"><a><br>\n';
    //====================================================
    if (type == "Buttom whatsapp")
      y = '<a href="https://$args"><img src="https://github.com/marco0antonio0/Gerador-README-Flutter/blob/e6b48f8f422605559cebc4da02aeae6037972dd8/repositorio_images/BTN_chame_no_whatsapp.png" alt="drawing" width="30%" height="auto"><a><br>\n';
    //====================================================

    return y;
  }

  //====================================================
  String? text_pass;

  //====================================================

  //====================================================
}
