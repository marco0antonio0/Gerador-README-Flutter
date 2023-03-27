import 'package:compilador_readme/controller/controllerPages.dart';
import 'package:compilador_readme/view/Page_2.dart';
import 'package:compilador_readme/view/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

Backend instance = Backend.instance;

class Page_1 extends StatefulWidget {
  const Page_1({super.key});

  @override
  State<Page_1> createState() => _Page_1State();
}

class _Page_1State extends State<Page_1> {
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
      Scrollbar(
          controller: scrollControler,
          isAlwaysShown: true,
          interactive: true,
          child: Container(
              height: altura - responsive - 120,
              width: largura,
              child: ListView.builder(
                  controller: scrollControler,
                  itemCount: instance.qtds_itens,
                  itemBuilder: (context, index) {
                    return ListBTN(index);
                  }))),
      BTN_F(largura, fn: () {
        instance.gerar();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Page_2()));
      })
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

//======================================================================
class ListBTN extends StatefulWidget {
  ListBTN(this.x, {super.key});
  int? x;
  @override
  State<ListBTN> createState() => _ListBTNState();
}

//======================================================================
class _ListBTNState extends State<ListBTN> {
  //===================================================
  final Textcontroller = TextEditingController();
  List<Map<dynamic, dynamic>> statusBTN = [
    {'text': 'H1', 'status': true},
    {'text': 'H2', 'status': false},
    {'text': 'H3', 'status': false},
    {'text': 'Text', 'status': false},
    {'text': 'Image', 'status': false},
  ];
  @override
  Widget build(BuildContext context) {
    //===================================================
    double responsive_width = 200;
    controllerBTN(x) {
      setState(() => statusBTN[x]['status'] =
          statusBTN[x]['status'] == true ? false : true);
      for (int i = 0; i < statusBTN.length; i++) {
        if (i != x && statusBTN[i]['status'] == true)
          setState(() => statusBTN[i]['status'] = false);
      }
    }

    //===================================================

    final scrollControler = ScrollController();

    double largura = MediaQuery.of(context).size.width;
    //===================================================
    double responsive_height = 80;
    if (largura < 1000) responsive_height -= 20;
    if (largura < 800) responsive_width -= 20;
    if (largura < 600) responsive_width -= 20;
    //===================================================
    isTrueList(List statusBTN) {
      for (int i = 0; i < statusBTN.length; i++) {
        if (statusBTN[i]['status'] == true) return statusBTN[i]['text'];
      }
    }

    //===================================================

    return Column(children: [
      widget.x != 0
          ? Container(
              margin: EdgeInsets.only(top: 20),
              height: 1,
              width: largura,
              color: Colors.black)
          : Container(),
      Scrollbar(
          controller: scrollControler,
          isAlwaysShown: true,
          interactive: true,
          child: Container(
              height: responsive_height,
              width: largura,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: ListView.builder(
                  controller: scrollControler,
                  scrollDirection: Axis.horizontal,
                  itemCount: statusBTN.length,
                  itemBuilder: (context, index) {
                    return BTN(controllerBTN, index, responsive_height,
                        responsive_width, statusBTN);
                  }))),
      //==============================================================================================<<<<<<<<<

      textBloco(largura: largura, text: isTrueList(statusBTN)),
      textFieldPerson(largura, Textcontroller, widget.x, isTrueList(statusBTN)),
      instance.qtds_itens - 1 == widget.x ? BTN_circular(largura) : Container(),
      //==============================================================================================<<<<<<<<<
    ]);
  }
}

//======================================================================
//  TextField >> campo de texto
Widget textFieldPerson(largura, Textcontroller, controler_x, type,
    {qtds_linha = 1}) {
  double responsive_width = 700;
  if (largura < 790) responsive_width -= 100;
  if (largura < 690) responsive_width -= 100;
  if (largura < 590) responsive_width -= 100;
  if (largura < 490) responsive_width -= 100;
  if (type.toString() == 'Text') {
    qtds_linha = 10;
  } else {
    qtds_linha = 1;
  }
  return Container(
      width: largura,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: EdgeInsets.only(left: 40),
              width: responsive_width,
              child: TextField(
                  maxLines: qtds_linha,
                  controller: Textcontroller,
                  onChanged: (value) {
                    if (value.length > 0) {
                      try {
                        instance.controleDeDados[controler_x] = {
                          'id': controler_x,
                          'type': type.toString(),
                          'text': value.toString()
                        };
                      } catch (e) {
                        instance.controleDeDados.add({
                          'id': controler_x,
                          'type': type.toString(),
                          'text': value.toString()
                        });
                      }
                    } else {
                      instance.controleDeDados.removeAt(controler_x);
                    }

                    print(instance.controleDeDados);
                  },
                  decoration: InputDecoration(
                      suffixText: type.toString(),
                      fillColor: Colors.white,
                      filled: true,
                      label: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: textPerson(text: 'digite')),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.4))))))));
}

textBloco({text = '', largura}) {
  return Container(
    height: 50,
    width: largura,
    child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
            margin: EdgeInsets.only(left: 50), child: textPerson(text: text))),
  );
}

//=======================================================================================
// BTN >> ListBTN
Widget BTN(
    controllerBTN, index, responsive_height, responsive_width, statusBTN) {
  return InkWell(
      onTap: () => controllerBTN(index),
      child: Center(
        child: Container(
            height: responsive_height,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: responsive_width,
            decoration: BoxDecoration(
                boxShadow: Efeito_sombra(),
                borderRadius: BorderRadius.circular(30),
                color: Color(
                    statusBTN[index]['status'] ? 0xff71CCFF : 0xff8A99A2)),
            child: Center(
                child: textPerson(
                    text: statusBTN[index]['text'], color: Colors.white))),
      ));
}

//====================================================
//  Gerar README >>
Widget BTN_F(largura, {@required fn}) {
  double responsive_width = 700;
  if (largura < 790) responsive_width -= 100;
  if (largura < 690) responsive_width -= 100;
  if (largura < 590) responsive_width -= 100;
  if (largura < 490) responsive_width -= 100;
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
        margin: EdgeInsets.only(left: 40, bottom: 30),
        width: responsive_width,
        alignment: Alignment(0, 0),
        child: InkWell(
            onTap: () => fn(),
            child: Container(
                height: 70,
                width: 250,
                child: Center(
                    child: textPerson(
                        text: 'Gerar README >>', color: Colors.white)),
                decoration: BoxDecoration(
                    boxShadow: Efeito_sombra(),
                    color: Color(0xff55FFC2),
                    borderRadius: BorderRadius.circular(50))))),
  );
}

Widget BTN_circular(largura, {status = true, controler_x}) {
  double responsive_width = 700;
  if (largura < 790) responsive_width -= 100;
  if (largura < 690) responsive_width -= 100;
  if (largura < 590) responsive_width -= 100;
  if (largura < 490) responsive_width -= 100;
  return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          margin: EdgeInsets.only(left: 40),
          width: responsive_width,
          child: Center(
            child: CircularImage(
                image: status ? 'images/BTN_plus.png' : 'images/BTN_minus.png',
                largura: largura,
                default_: false,
                fn: status
                    ? () {
                        instance.qtds_itens += 1;
                        instance.setState(() {});
                      }
                    : () {}),
          )));
}
