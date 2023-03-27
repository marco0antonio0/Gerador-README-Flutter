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
    {'id': '0', 'type': 'null', 'text': 'null'}
  ];
  String GerarTexto = '';
  gerar() {
    for (var i = 0; i < controleDeDados.length; i++) {
      GerarTexto += controleDeDados[i]['text'];
    }
    return GerarTexto;
  }

  fn_typeFormat(type, args) {
    var y = '';
    if (type == "H1") y = "# $args\n";
    if (type == "H2") y = "## $args\n";
    if (type == "H3") y = "### $args\n";
    if (type == "Text") y = "<span><br>$args <br><\span>\n";
    if (type == "Image") y = "![img]($args)\n";
    /* ![img](https://github.com/marco0antonio0/marco0antonio0/blob/main/imagens/img_page.png?raw=true */
    return y;
  }
}
