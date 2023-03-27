import 'package:flutter/material.dart';

class Backend {
  Backend._();
  static final Backend instance = Backend._();
  List README = [];
  inserir_H1(x) {
    String args = "#   $x";
    README.add(args);
    print(README);
  }

  var setState;
  int qtds_itens = 1;

  List<Map<dynamic, dynamic>> controleDeDados = [
    {'id': '0', 'type': 'null', 'text': 'null', 'link': 'null'}
  ];
  String GerarTexto = '';
  gerar() {
    String text = '';
    String args2 = '';
    for (var i = 0; i < controleDeDados.length; i++) {
      if (controleDeDados[i]['text'].length > 0) {
        text += fn_typeFormat(controleDeDados[i]['type'],
            controleDeDados[i]['text'], controleDeDados[i]['link']);
      }
    }
    return text;
  }

  fn_typeFormat(type, args, args2) {
    var y = '';
    if (type == "H1") y = "# $args\n";
    if (type == "H2") y = "## $args\n";
    if (type == "H3") y = "### $args\n";
    if (type == "Text") y = "<span><br>$args <br><\span>\n";
    if (type == "Image") y = "![img]($args)\n";
    if (type == "Image Button") y = "[![img]($args)]($args2)\n";
    return y;
  }
}
