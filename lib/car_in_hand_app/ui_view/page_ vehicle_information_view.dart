import 'package:carronamao/car_in_hand_app/api/car_in_hand_api.dart';
import 'package:carronamao/car_in_hand_app/mocks/kind_of_service_mocks.dart';
import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../car_in_hand_app_theme.dart';

class PageVehicleInformationView extends StatefulWidget {
  const PageVehicleInformationView({Key? key}) : super(key: key);

  @override
  State<PageVehicleInformationView> createState() =>
      _PageVehicleInformationViewState();
}

class _PageVehicleInformationViewState
    extends State<PageVehicleInformationView> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController _dateController =
        TextEditingController(text: '');
    late TextEditingController _hoursController =
        TextEditingController(text: '');
    late TextEditingController _noteController =
        TextEditingController(text: '');

    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: CarInHandAppTheme.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: CarInHandAppTheme.grey.withOpacity(0.4),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Marca",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 33,
                                    child: CupertinoTextField(
                                      controller: _noteController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 1,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Modelo",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 33,
                                    child: CupertinoTextField(
                                      controller: _noteController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 1,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Ano",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 33,
                                    child: CupertinoTextField(
                                      controller: _noteController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 1,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Placa",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 33,
                                    child: CupertinoTextField(
                                      controller: _noteController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 1,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Kilometragem atual",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 33,
                                    child: CupertinoTextField(
                                      controller: _noteController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 1,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Média de kilometragem por mês",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 33,
                                    child: CupertinoTextField(
                                      controller: _noteController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 1,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                    top: 30,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    child: CupertinoButton(
                                      disabledColor:
                                          CupertinoColors.inactiveGray,
                                      onPressed: () {},
                                      color: const Color.fromARGB(
                                          255, 91, 88, 251),
                                      child: const Text('Salvar'),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
