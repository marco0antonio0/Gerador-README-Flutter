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
Widget BTN_type({type = '', status = false, index, fn}) {
  return InkWell(
    onTap: () => fn(),
    child: Container(
        height: 60,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: textPerson(enable: false, text: type),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: status ? Colors.blue : Colors.black38)),
  );
}

//==========================================================================
// TextField
Widget TextFielPerson(responsive_larguraContainer,
    {controller, enabled = true, index_x}) {
  return Container(
      height: 50,
      width: responsive_larguraContainer * 0.7,
      child: TextField(
          enabled: enabled,
          onChanged: (value) {
            instance.dados[index_x]['args'] = value.toString();
            print(instance.dados);
          },
          controller: controller,
          decoration: InputDecoration(
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
