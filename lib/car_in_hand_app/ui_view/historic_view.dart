import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:flutter/material.dart';
import '../car_in_hand_app_theme.dart';

class HistoricView extends StatelessWidget {
  final String title;
  final String description;
  const HistoricView({required this.title, required this.description, Key? key})
      : super(key: key);

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
                                  title,
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
                              description,
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
