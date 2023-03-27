import 'package:flutter/material.dart';

//==========================================================================
Text textPerson(
    {text = '',
    fontSize = 20,
    fontWeight = null,
    color = Colors.black,
    fontStyle = FontStyle.normal,
    TextAlign = TextAlign.left}) {
  return Text(
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
Widget CircularImage(
    {fn,
    responsive = 120,
    @required image = 'images/logo.png',
    @required largura,
    efeito = false,
    @required default_ = false}) {
  int responsive = 120;
  if (default_) {
    if (largura < 1100) responsive = 90;
    if (largura < 750) responsive = 80;
    if (largura < 590) responsive = 70;
  }
  return InkWell(
    onTap: () => fn(),
    child: Container(
        height: responsive - 10,
        width: responsive - 10,
        decoration: BoxDecoration(
            boxShadow: efeito ? Efeito_sombra() : null,
            image: DecorationImage(image: AssetImage(image)),
            shape: BoxShape.circle)),
  );
}

//========================================================<<<<<<<<<<<<<<<<<
//
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

//========================================================<<<<<<<<<<<<<<<<<
Widget topbar(largura, {@required children, @required responsive}) {
  int responsive_padding = 70;
  if (largura < 590) responsive_padding = 20;
  int responsive_flex = 4;
  if (largura < 700) responsive_flex += 20;

  return Container(
    height: responsive * 1,
    width: largura,
    padding: EdgeInsets.only(left: responsive_padding * 1),
    decoration:
        BoxDecoration(color: Color(0xff535353), boxShadow: Efeito_sombra()),
    child: Row(
      children: children,
    ),
  );
}
