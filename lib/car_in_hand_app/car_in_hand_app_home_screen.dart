import 'package:carronamao/car_in_hand_app/historical/historical_screen.dart';
import 'package:carronamao/car_in_hand_app/menu/menu_screen.dart';
import 'package:carronamao/car_in_hand_app/mocks/stick_nodes_mocks.dart';
import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:carronamao/car_in_hand_app/models/tabIcon_data.dart';
import 'package:carronamao/car_in_hand_app/recall/recall_screen.dart';
import 'package:carronamao/car_in_hand_app/repository/sticky_repository.dart';
import 'package:carronamao/car_in_hand_app/sticky_notes/sticky_notes_screen.dart';
import 'package:carronamao/car_in_hand_app/sticky_notes/add_sticky_notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'api/car_in_hand_api.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'car_in_hand_app_theme.dart';

class CarInHandAppHomeScreen extends StatefulWidget {
  @override
  CarInHandAppHomeScreenState createState() => CarInHandAppHomeScreenState();
}

class CarInHandAppHomeScreenState extends State<CarInHandAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<StickNote> services = <StickNote>[];

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  late StickyRepository stickyRepository;

  int idModify = 0;

  Widget tabBody = Container(
    color: CarInHandAppTheme.background,
  );

  @override
  void initState() {
    resetNavigation();
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 10), vsync: this);
    tabBody = HistoricalScreen(animationController: animationController);

    //buscar a lista de servicos
    CarInHandApi.getStickNotesByStatus(StickNodeStatusEnum.PENDENTE)
        .then((res) => services = res);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    stickyRepository = context.watch<StickyRepository>();
    return Container(
      color: CarInHandAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  void getFilterServicesPending() {
    var servicesNotPending = services
        .where((item) => item.status != StickNodeStatusEnum.PENDENTE)
        .toList();
    for (var service in servicesNotPending) {
      services.removeAt(services.indexOf(service));
    }
  }

  void resetNavigation() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
  }

  void onUpdateStick() {
    idModify = stickyRepository.idStickyUpdate;
    animationController?.reverse().then<dynamic>((data) {
      if (!mounted) {
        return;
      }

      setState(() {
        resetNavigation();
        tabBody = AddStickyNotesScreen(
            animationController: animationController,
            services: services,
            idModify: idModify,
            onSalve: () {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  stickyRepository.setIdStickyUpdate(0);
                  idModify = stickyRepository.idStickyUpdate;
                  getFilterServicesPending();
                  resetNavigation();
                  tabIconsList[2].isSelected = true;
                  tabBody = StickyNotesScreen(
                    animationController: animationController,
                    services: services,
                    onUpdate: onUpdateStick,
                  );
                });
              });
            });
      });
    });
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            // click do botao
            setState(() {
              tabBody = AddStickyNotesScreen(
                  animationController: animationController,
                  services: services,
                  idModify: idModify,
                  onSalve: () {
                    animationController?.reverse().then<dynamic>((data) {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        stickyRepository.setIdStickyUpdate(0);
                        idModify = stickyRepository.idStickyUpdate;
                        getFilterServicesPending();
                        resetNavigation();
                        tabIconsList[2].isSelected = true;
                        tabBody = StickyNotesScreen(
                          animationController: animationController,
                          services: services,
                          onUpdate: onUpdateStick,
                        );
                      });
                    });
                  });
            });
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = HistoricalScreen(
                      animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      RecallScreen(animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                getFilterServicesPending();
                setState(() {
                  tabBody = StickyNotesScreen(
                    animationController: animationController,
                    services: services,
                    onUpdate: onUpdateStick,
                  );
                });
              });
            } else {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MenuScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
