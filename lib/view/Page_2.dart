import 'dart:math';

import 'package:compilador_readme/controller/controllerPages.dart';
import 'package:compilador_readme/view/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

Backend instance = Backend.instance;

class Page_2 extends StatefulWidget {
  const Page_2({super.key});

  @override
  State<Page_2> createState() => _Page_2State();
}

class _Page_2State extends State<Page_2> {
  TextEditingController controller =
      TextEditingController(text: instance.GerarTexto);
  @override
  final scrollControler = ScrollController();
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double responsive = 120;
    if (largura < 1100) responsive = 90;
    if (largura < 750) responsive = 80;
    if (largura < 590) responsive = 70;

    instance.setState = setState;
    return Scaffold(
        body: Container(
            child: Column(children: [
      topBar_(largura, responsive),
      Align(
          alignment: Alignment(-.85, 0),
          child: Container(
              height: 90,
              width: 700,
              alignment: Alignment.centerLeft,
              child: textPerson(
                  text:
                      'README GERADO COM SUCESSO !!\nCOPIE E COLE O CODIGO NO SEU ARQUIVO “README”'))),
      //====================================================================================================
      Align(
          alignment: Alignment(-.95, 0),
          child: Container(
              margin: EdgeInsets.only(top: 10),
              width: 700,
              height: altura - responsive - 300,
              //color: Colors.red,
              child: TextField(
                  readOnly: true,
                  scribbleEnabled: true,
                  controller: controller,
                  maxLines: 90,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(.5))))))),
      //====================================================================================================
      SizedBox(height: 20),
      Align(
          alignment: Alignment(-1, 0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 90,
            width: 700,
            alignment: Alignment.centerLeft,
            child: Center(
              child: InkWell(
                onTap: () async {
                  await Clipboard.setData(
                      ClipboardData(text: instance.GerarTexto));
                  // copied successfully
                },
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff55FFC2),
                      boxShadow: Efeito_sombra()),
                  child: Center(
                    child: textPerson(text: 'Copy code', color: Colors.white),
                  ),
                ),
              ),
            ),
          )),
    ])));
  }
}

//======================================================================
Widget topBar_(largura, responsive) {
  double responsive_fontsie_1 = 29;
  if (largura < 1300) responsive_fontsie_1 -= 5;
  if (largura < 600) responsive_fontsie_1 -= 5;
  if (largura < 600) responsive_fontsie_1 -= 5;
  int responsive_flex = 1;
  if (largura < 1100) responsive_flex += 3;
  if (largura < 700) responsive_flex += 1;
  return topbar(largura, responsive: responsive, children: [
    Spacer(flex: 2),
    CircularImage(image: 'images/Logo.png', default_: true, largura: largura),
    Spacer(flex: responsive_flex),
    textPerson(
        text: 'Go to Create README',
        color: Colors.white,
        fontSize: responsive_fontsie_1),
    Spacer(flex: 100),
  ]);
}
