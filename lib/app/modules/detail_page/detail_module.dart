import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detail_controller.dart';
import 'detail_page.dart';

class DetailModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetailController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => DetailPage(
                  locationCard: args.data,
                ),customTransition: CustomTransition(
                transitionBuilder: (__, anim1, anim2, child) =>
                    FadeTransition(opacity: anim1, child: child),
                transitionDuration:Duration(milliseconds: 600))),
      ];

  static Inject get to => Inject<DetailModule>.of();
}
