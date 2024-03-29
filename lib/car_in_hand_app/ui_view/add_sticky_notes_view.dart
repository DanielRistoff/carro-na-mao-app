// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:carronamao/car_in_hand_app/api/car_in_hand_api.dart';
import 'package:carronamao/car_in_hand_app/mocks/kind_of_service_mocks.dart';
import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../car_in_hand_app_theme.dart';

class AddStickyNotesView extends StatefulWidget {
  List<StickNote> services;
  final VoidCallback onSalve;
  final int idModify;

  AddStickyNotesView(
      {required this.services,
      required this.onSalve,
      required this.idModify,
      Key? key})
      : super(key: key);

  @override
  State<AddStickyNotesView> createState() => _AddStickyNotesViewState();
}

class _AddStickyNotesViewState extends State<AddStickyNotesView> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController _dateController =
        TextEditingController(text: '');
    late TextEditingController _hoursController =
        TextEditingController(text: '');
    late TextEditingController _noteController =
        TextEditingController(text: '');

    late String _dateSelected = '';
    late String _hourSelected = '';
    late String _kindOfServiceInit = '';
    late DateTime _dateCreateSticky = DateTime.now();

    List<String> _kindOfServices =
        KindOfServiceMocks().getKindOfServicesDescription();

    KindOfService _kindOfServiceSelected = KindOfServiceMocks()
        .getKindOfServicePerDescription(description: "Outros");

    StickNote getServiceOfList(int idService) {
      var service = widget.services
          .where((item) => item.id == idService)
          .toList()
          .firstWhere((widget) => true);
      return service;
    }

    if (widget.idModify > 0) {
      StickNote stickNote = getServiceOfList(widget.idModify);
      _dateSelected = stickNote.date;
      _hourSelected = stickNote.hour;
      _noteController.text = stickNote.note!;
      _dateController.text = stickNote.date;
      _hoursController.text = stickNote.hour;
      _kindOfServiceSelected = stickNote.kindOfService;
      _kindOfServiceInit = stickNote.kindOfService.description;
      _dateCreateSticky = stickNote.created;
    }

    void salveStick() {
      if (_dateSelected != '' && _hourSelected != '') {
        StickNote sn = StickNote(
            id: widget.idModify > 0 ? widget.idModify : 1,
            date: _dateSelected,
            hour: _hourSelected,
            kindOfService: _kindOfServiceSelected,
            note: _noteController.text,
            status: StickNodeStatusEnum.PENDENTE,
            created: _dateCreateSticky,
            update: widget.idModify > 0 ? DateTime.now() : null);
        if (widget.idModify > 0) {
          CarInHandApi.updateStickNote(sn);
          StickNote stickNoteUpdate = getServiceOfList(widget.idModify);
          stickNoteUpdate.date = sn.date;
          stickNoteUpdate.hour = sn.hour;
          stickNoteUpdate.kindOfService = sn.kindOfService;
          stickNoteUpdate.note = sn.note;
          stickNoteUpdate.status = sn.status;
          stickNoteUpdate.created = sn.created;
          stickNoteUpdate.update = sn.update;
        } else {
          CarInHandApi.createStickNote(sn);
          widget.services.add(sn);
        }
      }
    }

    void salveStickAndReturn() {
      salveStick();
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
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  top: 16,
                                ),
                                child: Text(
                                  "Data",
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
                                    left: 10,
                                    top: 16,
                                  ),
                                  child: SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: CupertinoTextField(
                                        controller: _dateController,
                                        enabled: false,
                                      ))),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.date_range),
                                    onPressed: () async {
                                      final data = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:
                                            DateTime(DateTime.now().year),
                                        lastDate:
                                            DateTime(DateTime.now().year + 1),
                                        locale: const Locale("pt", "BR"),
                                      );
                                      if (data != null) {
                                        final dataFormatted =
                                            DateFormat.yMd("pt_BR")
                                                .format(data);

                                        _dateSelected = dataFormatted;

                                        _dateController.value =
                                            TextEditingValue(
                                          text: dataFormatted,
                                          selection: TextSelection.fromPosition(
                                            TextPosition(
                                                offset: dataFormatted.length),
                                          ),
                                        );
                                      }
                                    },
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  top: 16,
                                ),
                                child: Text(
                                  "Hora",
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
                                    left: 10,
                                    top: 16,
                                  ),
                                  child: SizedBox(
                                      width: 55,
                                      height: 30,
                                      child: CupertinoTextField(
                                        controller: _hoursController,
                                        enabled: false,
                                      ))),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.access_time),
                                    onPressed: () async {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );

                                      if (time != null) {
                                        final now = DateTime.now();
                                        final dt = DateTime(now.year, now.month,
                                            now.day, time.hour, time.minute);
                                        final format = DateFormat.Hm();
                                        final hourFormatted = format.format(dt);

                                        _hourSelected = hourFormatted;

                                        _hoursController.value =
                                            TextEditingValue(
                                          text: hourFormatted,
                                          selection: TextSelection.fromPosition(
                                            TextPosition(
                                                offset: hourFormatted.length),
                                          ),
                                        );
                                      }
                                    },
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
                                  "Tipo de serviço",
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
                                    height: 70,
                                    child: Autocomplete<String>(
                                      initialValue: TextEditingValue(
                                          text: _kindOfServiceInit),
                                      optionsBuilder:
                                          (TextEditingValue textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return _kindOfServices
                                            .where((String option) {
                                          return option.contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        });
                                      },
                                      onSelected: (String selection) {
                                        _kindOfServiceSelected =
                                            KindOfServiceMocks()
                                                .getKindOfServicePerDescription(
                                                    description: selection);
                                      },
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
                                  "Observação",
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
                                    height: 70,
                                    child: CupertinoTextField(
                                      controller: _noteController,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 1,
                                      maxLines: 3,
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
                                    top: 50,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    child: CupertinoButton(
                                      disabledColor:
                                          CupertinoColors.inactiveGray,
                                      onPressed: salveStickAndReturn,
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
