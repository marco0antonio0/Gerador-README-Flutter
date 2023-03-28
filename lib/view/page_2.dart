import 'package:facilities_readme/controller/controller.dart';
import 'package:facilities_readme/view/widget.dart';
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
  final controller_text = TextEditingController(text: instance.text_pass);
  final controller = ScrollController();
  bool smartphone = false;
  @override
  Widget build(BuildContext context) {
    instance.setState = setState;

    double largura = MediaQuery.of(context).size.width;
    if (largura < 753) smartphone = true;
    double margem = 40;

    print(largura);
    return Scaffold(
        body: Container(
      width: largura,
      child: Column(children: [
        appBar(largura),
        Container(
            width: largura,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 30, bottom: 5, left: 40),
            child: textPerson(
                text:
                    'README GERADO COM SUCESSO !!\nCOPIE E COLE O CODIGO NO SEU ARQUIVO “README” ')),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(
                left: margem, top: 20, bottom: 20, right: margem),
            width: 900,
            child: TextField(
              controller: controller_text,
              maxLines: 20,
              readOnly: true,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(1)))),
            ),
          ),
        ),
        //==========================================
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: EdgeInsets.only(bottom: 100),
              width: 700,
              height: 70,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    //
                    Clipboard.setData(ClipboardData(text: instance.text_pass));
                    //
                  },
                  child: Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff55FFC2),
                        boxShadow: Efeito_sombra()),
                    child: Center(
                      child: textPerson(enable: false, text: 'Copia codigo !!'),
                    ),
                  ),
                ),
              )),
        )
      ]),
    ));
  }
}

//====================================================
//  appBar
Widget appBar(largura) {
  double responsive_altura = 120;
  if (largura < 1456) responsive_altura -= 10;
  if (largura < 1092) responsive_altura -= 10;
  if (largura < 745) responsive_altura -= 10;
  //==================================================
  double fontsize_1 = 30;
  double fontsize_2 = 17;
  if (largura < 1272) fontsize_1 -= 2;
  if (largura < 1272) fontsize_2 -= 2;
  if (largura < 1040) fontsize_1 -= 2;
  if (largura < 1040) fontsize_2 -= 2;

  return Container(
    width: largura,
    height: responsive_altura,
    color: Color(0xff535353),
    child: Row(children: [
      //===================================================
      Spacer(flex: 5),
      //===================================================
      //  logo
      Align(
          alignment: Alignment.center,
          child: CircularImage(responsive_altura - 10, 'images/Logo.png')),
      //===================================================
      Spacer(flex: 2),
      //===================================================
      //  textLogo
      Container(
          width: 300,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(
                alignment: Alignment.centerLeft,
                child: textPerson(
                    text: 'Facilities Readme',
                    fontSize: fontsize_1,
                    color: Colors.white)),
            Align(
                alignment: Alignment.centerLeft,
                child: textPerson(
                    text: 'faça readmes facil e rapido',
                    fontSize: fontsize_2,
                    color: Colors.white)),
          ])),
      //===================================================
      Spacer(flex: 100),
      //===================================================
    ]),
  );
}
