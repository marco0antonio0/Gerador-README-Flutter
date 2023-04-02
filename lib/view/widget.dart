import 'package:flutter/material.dart';

import '../controller/controller.dart';

Backend instance = Backend.instance;

//==========================================================================
Widget textPerson(
    {text = '',
    enable = true,
    fontSize = 20,
    fontWeight = null,
    color = Colors.black,
    fontStyle = FontStyle.normal,
    TextAlign = TextAlign.left}) {
  return enable
      ? SelectableText(
          text,
          enableInteractiveSelection: enable,
          showCursor: false,
          style: TextStyle(
              fontSize: fontSize * 1,
              fontWeight: fontWeight,
              color: color,
              fontStyle: fontStyle),
          textAlign: TextAlign,
        )
      : Text(
          text,
          style: TextStyle(
              fontSize: fontSize * 1,
              fontWeight: fontWeight,
              color: color,
              fontStyle: fontStyle),
          textAlign: TextAlign,
        );
}

//==========================================================================

List<BoxShadow> Efeito_sombra() {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ];
}
//==========================================================================

Widget CircularImage(size, image, {enable = true}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(image)),
        boxShadow: enable ? Efeito_sombra() : null),
  );
}

//==========================================================================
//  BTN_type
class BTN_type extends StatelessWidget {
  BTN_type(
      {this.type = '', this.status = false, this.index, this.fn, super.key});
  var type;
  var status;
  var index;
  Function? fn;
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double responsive = 0;
    if (largura < 1450) responsive -= 20;
    if (largura < 650) responsive -= 20;
    if (largura < 550) responsive -= 20;
    return InkWell(
      onTap: () => fn!(),
      child: Container(
          height: 60 + responsive,
          width: 200 + responsive,
          margin: EdgeInsets.symmetric(horizontal: largura < 700 ? 20 : 10),
          child: Center(
            child: textPerson(
                enable: false, text: type, fontSize: 20 + (responsive * 0.1)),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: status ? Colors.blue : Colors.black38)),
    );
  }
}

//==========================================================================
// TextField
Widget TextFielPerson(responsive_larguraContainer,
    {controller, enabled = true, index_x, textLabel = '', default_ = true}) {
  var type = instance.dados[index_x]['type'];
  var response = 0.7;
  if (type == 'Text') response = 1;
  if (type == 'Buttom Image') response = 0.5;
  if (type == 'Image') response = 0.5;
  if (type == 'H1' || type == 'H2' || type == 'H3') response = 0.6;
  return Container(
      width: responsive_larguraContainer * (response),
      child: TextField(
          maxLines: type == 'Text' || type == 'code' ? 20 : 1,
          enabled: enabled,
          onChanged: (value) {
            instance.dados[index_x][default_ ? 'args' : 'args2'] =
                value.toString();
            print(instance.dados);
          },
          controller: controller,
          decoration: InputDecoration(
              labelText: textLabel.length > 0 ? textLabel : type,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40)))));
}

//==========================================================================
// BTN edite
Widget BTN_edite(responsive_larguraContainer, {fn}) {
  return InkWell(
      onTap: () => fn(),
      child: Container(
        height: 50,
        width: responsive_larguraContainer * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xff55FFC2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 100),
            textPerson(enable: false, text: 'Edite', fontSize: 18),
            Spacer(flex: 20),
            Icon(Icons.edit_note),
            Spacer(flex: 100),
          ],
        ),
      ));
}

//==========================================================================
// BTN edite
Widget BTN_salve(responsive_larguraContainer, {fn}) {
  return InkWell(
      onTap: () => fn(),
      child: Container(
        height: 50,
        width: responsive_larguraContainer * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xff55FFC2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 100),
            textPerson(enable: false, text: 'Salvar', fontSize: 18),
            Spacer(flex: 20),
            Icon(Icons.edit_note),
            Spacer(flex: 100),
          ],
        ),
      ));
}

//==========================================================================
// BTN edite
Widget BTN_delete(responsive_larguraContainer, {fn}) {
  return InkWell(
      onTap: () => fn(),
      child: Container(
        height: 50,
        width: responsive_larguraContainer * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xffFF5555)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 100),
            textPerson(enable: false, text: 'Delete', fontSize: 18),
            Spacer(flex: 20),
            Icon(Icons.delete),
            Spacer(flex: 100),
          ],
        ),
      ));
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
          child: Container(
              margin: EdgeInsets.all(0 + (fontsize_2 / 2)),
              child: CircularImage(responsive_altura - 10, 'images/Logo.png'))),
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
