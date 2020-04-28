import 'package:animation_controlads/app/widgets/location_card_widget.dart';
import 'package:animation_controlads/app/widgets/trevel_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  int _currentPage = 0;

  List<LocationCard> location = [
    LocationCard(
        title: 'New York',
        imageUrl:
            'https://www.ef.com.br/sitecore/__/~/media/universal/pg/8x5/destination/US_US-NY_NYC_1.jpg'),
    LocationCard(
        title: 'Brasil',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTAxbBjDD5h1CiOfZdLKuiy7AcR5VTp0yylSq_3ZDn1e4ClWvdP&usqp=CAU'),
    LocationCard(
        title: 'Japão',
        imageUrl:
            'https://abrilquatrorodas.files.wordpress.com/2018/05/gettyimages-552605671.jpg?quality=70&strip=info'),
    LocationCard(
        title: 'Irlanda',
        imageUrl:
            'https://www.estudarfora.org.br/app/uploads/2018/07/interc%C3%A2mbio-de-idiomas-na-Irlanda-1.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey.shade400,
                    Color(0xFF8f9cac),
                  ],
                  stops: [
                    0.2,
                    0.6
                  ]),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView.builder(
              itemCount: 4,
              onPageChanged: (page) {
                controller.currentPage = page;
              },
              controller: PageController(viewportFraction: 0.7),
              itemBuilder: (_, index) {
                return Observer(
                  builder: (_) => AnimatedOpacity(
                    duration: duration,
                    child: TravelCard(
                      item: location[index],
                      itemSelected: controller.currentPage == index,
                    ),
                    opacity: controller.currentPage == index ? 1.0 : 0.4,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
