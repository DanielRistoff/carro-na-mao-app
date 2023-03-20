// ignore_for_file: no_leading_underscores_fol_identifiers, no_leading_underscores_for_local_identifiers

import 'package:carronamao/car_in_hand_app/models/person_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../car_in_hand_app_theme.dart';

class PagePersonalInformationView extends StatefulWidget {
  final PersonInformation personInformation;
  final VoidCallback onSalve;

  const PagePersonalInformationView(
      {required this.personInformation, required this.onSalve, Key? key})
      : super(key: key);

  @override
  State<PagePersonalInformationView> createState() =>
      _PagePersonalInformationViewState();
}

class _PagePersonalInformationViewState
    extends State<PagePersonalInformationView> {
  bool _switchNoticationValue = true;
  bool _switchCarControlValue = true;

  final celularMask = MaskTextInputFormatter(mask: '(##) #####-####');

  @override
  Widget build(BuildContext context) {
    late TextEditingController _nameController =
        TextEditingController(text: '');
    late TextEditingController _phoneNumberController =
        TextEditingController(text: '');
    late TextEditingController _loginController =
        TextEditingController(text: '');
    late TextEditingController _passwordController =
        TextEditingController(text: '');

    if (widget.personInformation.id! > 0) {
      _nameController.text = widget.personInformation.name!;
      _phoneNumberController.text = widget.personInformation.phoneNumber!;
      _loginController.text = widget.personInformation.login!;
      _passwordController.text = widget.personInformation.password!;
    }

    void onSalvePersonalInformation() {
      widget.personInformation.name = _nameController.text;
      widget.personInformation.phoneNumber = _phoneNumberController.text;
      widget.personInformation.login = _loginController.text;
      widget.personInformation.password = _passwordController.text;
      widget.personInformation.notify = _switchNoticationValue;
      widget.personInformation.controlMaintenance = _switchCarControlValue;
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
                                  "Nome",
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
                                      controller: _nameController,
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
                                  "Número do celular",
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
                                      controller: _phoneNumberController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [celularMask],
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
                                  "Login",
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
                                      controller: _loginController,
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
                                  "Senha",
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
                                      controller: _passwordController,
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
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 166,
                                  top: 20,
                                ),
                                child: Text(
                                  "Notificar",
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
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16,
                                ),
                                child: CupertinoSwitch(
                                  value: _switchNoticationValue,
                                  activeColor: CupertinoColors.activeBlue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _switchNoticationValue = value ?? false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 56,
                                  top: 20,
                                ),
                                child: Text(
                                  "Controlar manutenção",
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
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16,
                                ),
                                child: CupertinoSwitch(
                                  value: _switchCarControlValue,
                                  activeColor: CupertinoColors.activeBlue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _switchCarControlValue = value ?? false;
                                    });
                                  },
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
                                    top: 30,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    child: CupertinoButton(
                                      disabledColor:
                                          CupertinoColors.inactiveGray,
                                      onPressed: onSalvePersonalInformation,
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
