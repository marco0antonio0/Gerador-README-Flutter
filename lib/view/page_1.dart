import 'package:facilities_readme/controller/controller.dart';
import 'package:facilities_readme/view/page_2.dart';
import 'package:facilities_readme/view/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

Backend instance = Backend.instance;

class Page_1 extends StatefulWidget {
  const Page_1({super.key});

  @override
  State<Page_1> createState() => _Page_1State();
}

class _Page_1State extends State<Page_1> {
  final controller = ScrollController();
  final controller_text = TextEditingController();
  bool smartphone = false;
  @override
  Widget build(BuildContext context) {
    instance.setState = setState;

    double largura = MediaQuery.of(context).size.width;
    if (largura < 753) smartphone = true;
    return Scaffold(
        body: Container(
      width: largura,
      child: Column(children: [
        appBar(largura),
        Flexible(
          child: Scrollbar(
            controller: controller,
            child: ListView.builder(
                controller: controller,
                itemCount: instance.dados.length,
                itemBuilder: (context, index) {
                  final id = instance.dados[index]["id"];
                  return instance.dados[id]['widget'];
                }),
          ),
        ),
        //==========================================
      ]),
    ));
  }
}

//====================================================
// Bloco_args

class ListBTN extends StatefulWidget {
  ListBTN(this.index_x, {super.key});
  int? index_x;
  @override
  State<ListBTN> createState() => _ListBTNState();
}

class _ListBTNState extends State<ListBTN> {
  //
  bool smartphone = false;
  bool enable = false;
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerText_1 = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    instance.setState_2 = setState;
    void initState() {
      super.initState();
    }

    controllerText =
        TextEditingController(text: instance.dados[widget.index_x!]['args']);
    controllerText_1 =
        TextEditingController(text: instance.dados[widget.index_x!]['args2']);

    //
    double largura = MediaQuery.of(context).size.width;
    double responsive_larguraContainer = 700;
    largura < 956 ? smartphone = true : smartphone = false;
    print(largura);
    //
    return Container(
      width: largura,
      child: Column(
        children: [
          Container(width: largura, height: 1, color: Colors.black),

          //===============================================
          Rows_BTNs(enable, widget.index_x),
          //===============================================
          // Colunm > Textfiel,BTN_edite
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  //

                  width: largura,
                  // color: Colors.red,
                  margin: !smartphone
                      ? EdgeInsets.only(top: 20, bottom: 20, left: 40)
                      : EdgeInsets.only(top: 0, bottom: 0, left: 40, right: 40),
                  //
                  child: !smartphone
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //=======================================================
                            TextFielPerson(responsive_larguraContainer,
                                index_x: widget.index_x,
                                controller: controllerText,
                                enabled: enable),
                            //=======================================================
                            SizedBox(width: 10),
                            //=======================================================
                            instance.dados[widget.index_x!]['type'] ==
                                    'Buttom Image'
                                ? TextFielPerson(responsive_larguraContainer,
                                    index_x: widget.index_x,
                                    controller: controllerText_1,
                                    enabled: enable,
                                    default_: false,
                                    textLabel: 'Link')
                                : Container(),
                            //=======================================================
                            instance.dados[widget.index_x!]['type'] ==
                                    'Buttom Image'
                                ? SizedBox(width: 20)
                                : Container(),
                            //=======================================================
                            !enable
                                ? BTN_edite(responsive_larguraContainer,
                                    fn: () {
                                    setState(() {
                                      enable = enable ? false : true;
                                    });
                                  })
                                : Container(
                                    width:
                                        ((responsive_larguraContainer * 0.25) *
                                                2) +
                                            20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BTN_salve(responsive_larguraContainer,
                                            fn: () {
                                          setState(() {
                                            enable = enable ? false : true;
                                          });
                                        }),
                                        instance.itemCount - 1 !=
                                                widget.index_x!
                                            ? BTN_delete(
                                                responsive_larguraContainer,
                                                fn: () {
                                                setState(() {
                                                  enable =
                                                      enable ? false : true;
                                                });
                                                instance.dados[widget.index_x!]
                                                    ['type'] = 'delete';
                                                instance.dados[widget.index_x!]
                                                    ['widget'] = Container();
                                                instance.setState(() {});
                                              })
                                            : Container(),
                                      ],
                                    ),
                                  ),
                            //=======================================================
                            Spacer(flex: 100),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //=======================================================
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              width: responsive_larguraContainer,
                              child: TextFielPerson(responsive_larguraContainer,
                                  index_x: widget.index_x,
                                  controller: controllerText,
                                  enabled: enable),
                            ),
                            //=======================================================
                            instance.dados[widget.index_x!]['type'] ==
                                    'Buttom Image'
                                ? Container(
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    width: responsive_larguraContainer,
                                    child: TextFielPerson(
                                        responsive_larguraContainer,
                                        index_x: widget.index_x,
                                        controller: controllerText_1,
                                        enabled: enable,
                                        default_: false,
                                        textLabel: 'Link'),
                                  )
                                : Container(),
                            //=======================================================
                            Align(
                              alignment: Alignment.centerLeft,
                              child: !enable
                                  ? Container(
                                      margin:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      width: responsive_larguraContainer * 0.25,
                                      child: BTN_edite(
                                          responsive_larguraContainer, fn: () {
                                        setState(() {
                                          enable = enable ? false : true;
                                        });
                                      }))
                                  : Container(
                                      width: ((responsive_larguraContainer *
                                                  0.25) *
                                              2) +
                                          20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BTN_salve(responsive_larguraContainer,
                                              fn: () {
                                            setState(() {
                                              enable = enable ? false : true;
                                            });
                                          }),
                                          instance.itemCount - 1 !=
                                                  widget.index_x!
                                              ? BTN_delete(
                                                  responsive_larguraContainer,
                                                  fn: () {
                                                  setState(() {
                                                    enable =
                                                        enable ? false : true;
                                                  });
                                                  instance.dados[
                                                          widget.index_x!]
                                                      ['type'] = 'delete';
                                                  instance.dados[
                                                          widget.index_x!]
                                                      ['widget'] = Container();
                                                  instance.setState(() {});
                                                })
                                              : Container(),
                                        ],
                                      ),
                                    ),
                            )
                            //=======================================================
                          ],
                        ))),
          instance.itemCount - 1 == widget.index_x!
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      // color: Colors.red,
                      width: 700,
                      margin: EdgeInsets.only(left: 40),
                      child: Center(child: BTN_plus(enable, setState))),
                )
              : Container(),
          SizedBox(height: 5),
          instance.itemCount - 1 == widget.index_x!
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 40, top: 20),
                      width: 700,
                      child: btn_GerarReadme()))
              : Container(),
        ],
      ),
    );
  }
}

//=======================================================
// Rows_BTN
class Rows_BTNs extends StatefulWidget {
  Rows_BTNs(this.enable, this.index_x, {super.key});
  bool? enable;
  int? index_x;

  @override
  State<Rows_BTNs> createState() => _Rows_BTNsState();
}

class _Rows_BTNsState extends State<Rows_BTNs> {
  final controller = ScrollController();
  List<Map<String, dynamic>> BTNS = [
    {'type': 'H1', 'status': false},
    {'type': 'H2', 'status': false},
    {'type': 'H3', 'status': false},
    {'type': 'Text', 'status': false},
    {'type': 'code', 'status': false},
    {'type': 'Image', 'status': false},
    {'type': 'Buttom Image', 'status': false},
  ];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < BTNS.length; i++) {
      if (BTNS[i]['type'] == instance.dados[widget.index_x!]['type']) {
        BTNS[i]['status'] = true;
      } else {
        BTNS[i]['status'] = false;
      }
    }
    //=======================================================
    //  faz a verificação e controle logico do status dos
    //  botões clicados
    check_BTNS(index) {
      BTNS[index]['status'] = BTNS[index]['status'] ? false : true;
      instance.dados[widget.index_x!]['type'] = BTNS[index]['type'];
      for (var i = 0; i < BTNS.length; i++) {
        if (BTNS[i]['status'] == true && i != index) {
          BTNS[i]['status'] = false;
        }
      }
      instance.setState_2(() {});
      return BTNS;
    }

    //
    isType() {
      for (var i = 0; i < BTNS.length; i++) {
        if (BTNS[i]['status'] == true) {
          return BTNS[i]['type'];
        }
      }
    }

    double largura = MediaQuery.of(context).size.width;
    return Column(
      children: [
        widget.enable!
            ? Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: largura,
                  height: 90,
                  // color: Colors.red,
                  margin: EdgeInsets.only(top: 5, bottom: 5, left: 0),
                  child: Scrollbar(
                    controller: controller,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          itemCount: BTNS.length,
                          itemBuilder: (context, index) {
                            return BTN_type(
                                type: BTNS[index]['type'],
                                status: BTNS[index]['status'],
                                index: index,
                                fn: () {
                                  setState(() {
                                    BTNS = check_BTNS(index);
                                  });
                                });
                          }),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class btn_GerarReadme extends StatelessWidget {
  const btn_GerarReadme({super.key});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double responsive = 0;
    if (largura < 1450) responsive -= 10;
    if (largura < 650) responsive -= 10;
    if (largura < 550) responsive -= 10;
    print(largura);
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            margin: EdgeInsets.only(bottom: 100),
            width: 700 + (responsive * 2),
            height: 70 + (responsive * .5),
            child: Align(
                alignment: Alignment.center,
                child: InkWell(
                    onTap: () {
                      //
                      instance.text_pass = instance.gerar();
                      Get.to(() => Page_2());
                      //
                    },
                    child: Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xff55FFC2),
                            boxShadow: Efeito_sombra()),
                        child: Center(
                          child: textPerson(
                              enable: false,
                              text: 'Gerar README >>',
                              fontSize: 20 + (responsive * 0.1)),
                        ))))));
  }
}

class BTN_plus extends StatelessWidget {
  BTN_plus(this.enable, this.setState, {super.key});
  var enable;
  var setState;
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double responsive = 0;
    if (largura < 1450) responsive -= 10;
    if (largura < 650) responsive -= 10;
    if (largura < 550) responsive -= 10;
    return InkWell(
      onTap: () {
        int id = instance.itemCount++;
        instance.dados.add({
          'id': id,
          'type': 'H1',
          'args': '',
          'args2': '',
          'widget': ListBTN(id)
        });
        setState(() {
          enable = false;
        });
        instance.setState(() {});
      },
      child:
          CircularImage(100 + responsive, 'images/BTN_plus.png', enable: false),
    );
  }
}
