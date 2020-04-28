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
                )),
      ];

  static Inject get to => Inject<DetailModule>.of();
}
