import 'package:animation_controlads/app/widgets/location_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detail_controller.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final LocationCard locationCard;

  const DetailPage({Key key, this.title = "DetailPage", this.locationCard})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailController> {
  //use 'controller' variable to access controller

  void _onVerticalDrag({DragUpdateDetails details}) {
    if (details.primaryDelta > 3) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector(
            onVerticalDragUpdate: (details) =>
                _onVerticalDrag(details: details),
            child: Hero(
              tag: widget.locationCard.title,
              child: Image.network(
                widget.locationCard.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ...List.generate(10, (index) {
            return ListTile(
              title: Text('Testanmdo somente'),
              subtitle: Text('kljdklajdlasdjaslkdjasjdlsajdaslkj'),
              leading: CircleAvatar(
                radius: 15,
              ),
            );
          }),
        ],
      ),
    );
  }
}
