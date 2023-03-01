import 'package:carronamao/car_in_hand_app/car_in_hand_app_theme.dart';
import 'package:carronamao/car_in_hand_app/models/brand.dart';
import 'package:carronamao/car_in_hand_app/models/brand_model.dart';
import 'package:carronamao/car_in_hand_app/models/brand_model_year.dart';
import 'package:carronamao/car_in_hand_app/models/person_information.dart';
import 'package:carronamao/car_in_hand_app/models/vehicle.dart';
import 'package:carronamao/car_in_hand_app/models/vehicle_type_enum.dart';
import 'package:carronamao/car_in_hand_app/ui_view/page_%20vehicle_information_view.dart';
import 'package:carronamao/car_in_hand_app/ui_view/page_personal_information_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Sky { personalInformation, vehicleInformation }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.personalInformation: const Color(0xFFF2F3F8),
  Sky.vehicleInformation: const Color(0xFFF2F3F8),
};

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  PersonInformation personInformation = PersonInformation(
    id: 0,
    name: '',
    phoneNumber: '',
    login: '',
    password: '',
    email: '',
    notify: true,
    controlMaintenance: true,
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
  );

  Vehicle vehicle = Vehicle(
      id: 0,
      board: '',
      currentMileage: 0,
      averageMonthlyMileage: 0,
      brandModelYear: BrandModelYear(
        id: 0,
        brandModel: BrandModel(
          id: 0,
          brand: Brand(
            id: 0,
            description: 'teste',
          ),
          description: 'teste',
          vehicleType: VehicleTypeEnum.CAM,
        ),
        year: '2010',
      ));

  Sky _selectedSegment = Sky.personalInformation;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    listViews.add(PagePersonalInformationView(
        personInformation: personInformation, onSalve: () {}));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CarInHandAppTheme.background,
      child: CupertinoPageScaffold(
        backgroundColor: skyColors[_selectedSegment],
        navigationBar: CupertinoNavigationBar(
          middle: CupertinoSlidingSegmentedControl<Sky>(
            backgroundColor: CupertinoColors.systemGrey2,
            thumbColor: skyColors[_selectedSegment]!,
            groupValue: _selectedSegment,
            onValueChanged: (Sky? value) {
              if (value != null) {
                setState(() {
                  _selectedSegment = value;
                  listViews.removeAt(0);
                  if (_selectedSegment == Sky.personalInformation) {
                    listViews.add(PagePersonalInformationView(
                        personInformation: personInformation, onSalve: () {}));
                  } else {
                    listViews.add(PageVehicleInformationView(
                        vehicle: vehicle, onSalve: () {}));
                  }
                });
              }
            },
            children: const <Sky, Widget>{
              Sky.personalInformation: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Cadastro',
                  style: TextStyle(
                    fontFamily: CarInHandAppTheme.fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    color: CarInHandAppTheme.nearlyDarkBlue,
                  ),
                ),
              ),
              Sky.vehicleInformation: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Veículo',
                  style: TextStyle(
                    fontFamily: CarInHandAppTheme.fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    color: CarInHandAppTheme.nearlyDarkBlue,
                  ),
                ),
              ),
            },
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              getMainListViewUI(),
              getAppBarUI(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top -
                  45,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: CarInHandAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: CarInHandAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: CarInHandAppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
