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
  final controller_1 = ScrollController();
  bool smartphone = false;
  @override
  Widget build(BuildContext context) {
    //======================================================
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    //======================================================
    double responsive_altura = 120;
    if (largura < 1456) responsive_altura -= 10;
    if (largura < 1092) responsive_altura -= 10;
    if (largura < 745) responsive_altura -= 10;
    //======================================================
    instance.setState = setState;
    if (largura < 753) smartphone = true;
    double margem = 40;

    print(largura);
    return Scaffold(
        body: Container(
            width: largura,
            child: Column(children: [
              appBar(largura),
              Center(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    // color: Colors.red,
                    width: 900,
                    height: altura - responsive_altura,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: SingleChildScrollView(
                        controller: controller_1,
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 30, bottom: 5),
                                child: textPerson(
                                    text:
                                        'README GERADO COM SUCESSO !!\nCOPIE E COLE O CODIGO NO SEU ARQUIVO “README” ')),
                            Center(
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 20),
                                  child: Container(
                                    child: TextField(
                                        controller: controller_text,
                                        maxLines: 20,
                                        readOnly: true,
                                        enableInteractiveSelection: true,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black
                                                        .withOpacity(1))))),
                                  )),
                            ),
                            //==========================================
                            Center(
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 100),
                                    height: 70,
                                    child: Center(
                                      child: BTN_codigoCopiado(),
                                    )))
                          ],
                        ))),
              ))
            ])));
  }
}

class BTN_codigoCopiado extends StatefulWidget {
  const BTN_codigoCopiado({super.key});

  @override
  State<BTN_codigoCopiado> createState() => _BTN_codigoCopiadoState();
}

class _BTN_codigoCopiadoState extends State<BTN_codigoCopiado> {
  var enable = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Clipboard.setData(ClipboardData(text: instance.text_pass)),
        onHover: (value) => setState(() => enable = value),
        child: Container(
            margin: EdgeInsets.only(
                left: enable ? 0 : 20,
                right: enable ? 0 : 10,
                top: enable ? 0 : 15),
            height: 100,
            width: 280,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xff55FFC2),
                boxShadow: Efeito_sombra()),
            child: Center(
                child: textPerson(enable: false, text: 'Copia codigo !!'))));
  }
}
