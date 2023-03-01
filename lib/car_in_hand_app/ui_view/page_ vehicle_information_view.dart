// ignore_for_file: unused_localble, no_leading_underscores_for_local_identifiers

import 'package:carronamao/car_in_hand_app/models/vehicle.dart';
import 'package:flutter/cupertino.dart';
import '../car_in_hand_app_theme.dart';

class PageVehicleInformationView extends StatefulWidget {
  final Vehicle vehicle;
  final VoidCallback onSalve;

  const PageVehicleInformationView(
      {required this.vehicle, required this.onSalve, Key? key})
      : super(key: key);

  @override
  State<PageVehicleInformationView> createState() =>
      _PageVehicleInformationViewState();
}

class _PageVehicleInformationViewState
    extends State<PageVehicleInformationView> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController _brandController =
        TextEditingController(text: '');
    late TextEditingController _modelController =
        TextEditingController(text: '');
    late TextEditingController _yearController =
        TextEditingController(text: '');
    late TextEditingController _boardController =
        TextEditingController(text: '');
    late TextEditingController _currentMileageController =
        TextEditingController(text: '');
    late TextEditingController _averageMonthlyMileageController =
        TextEditingController(text: '');

    if (widget.vehicle.id! > 0) {
      _brandController.text =
          widget.vehicle.brandModelYear!.brandModel.brand.description;
      _modelController.text =
          widget.vehicle.brandModelYear!.brandModel.description;
      _yearController.text = widget.vehicle.brandModelYear!.year;
      _boardController.text = widget.vehicle.board!;
      _currentMileageController.text = widget.vehicle.currentMileage.toString();
      _averageMonthlyMileageController.text =
          widget.vehicle.averageMonthlyMileage.toString();
    }

    void onSalvePersonalInformation() {
      widget.vehicle.brandModelYear!.brandModel.brand.description =
          _brandController.text;
      widget.vehicle.brandModelYear!.brandModel.description =
          _modelController.text;
      widget.vehicle.brandModelYear!.year = _yearController.text;
      widget.vehicle.board = _boardController.text;
      widget.vehicle.currentMileage = int.parse(
          _currentMileageController.text.isEmpty
              ? '0'
              : _currentMileageController.text);
      ;
      widget.vehicle.averageMonthlyMileage = int.parse(
          _averageMonthlyMileageController.text.isEmpty
              ? '0'
              : _averageMonthlyMileageController.text);
      widget.onSalve();
    }

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
                                      controller: _brandController,
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
                                      controller: _modelController,
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
                                      controller: _yearController,
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
                                      controller: _boardController,
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
                                      controller: _currentMileageController,
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
                                      controller:
                                          _averageMonthlyMileageController,
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
