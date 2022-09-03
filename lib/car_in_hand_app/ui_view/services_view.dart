import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../car_in_hand_app_theme.dart';

class ServicesView extends StatelessWidget {
  final StickNote stickNode;
  const ServicesView({required this.stickNode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  stickNode.kindOfService.description,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              bottom: 12,
                              top: 4,
                              right: 16,
                            ),
                            child: Text(
                              stickNode
                                  .getDescriptionStickNote(), // tem que mudar
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: CarInHandAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 0.0,
                                color: CarInHandAppTheme.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 6,
                            left: 250,
                          ),
                          child: IconButton(
                            color: const Color.fromARGB(255, 22, 156, 51),
                            icon: const Icon(Icons.edit),
                            tooltip: 'Alterar',
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 6,
                          ),
                          child: IconButton(
                            color: const Color.fromARGB(255, 187, 14, 57),
                            icon: const Icon(Icons.delete),
                            tooltip: 'Deletar',
                            onPressed: () {},
                          ),
                        )
                      ])
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
