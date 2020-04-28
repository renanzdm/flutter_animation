import 'package:animation_controlads/app/widgets/location_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TravelCard extends StatefulWidget {
  const TravelCard({Key key, this.itemSelected, this.item}) : super(key: key);
  final bool itemSelected;
  final LocationCard item;

  @override
  _TravelCardState createState() => _TravelCardState();
}

class _TravelCardState extends State<TravelCard> {
  bool _selected = false;
  final avatars = <String>[
    'https://miro.medium.com/max/1440/1*LGK9zA-mEDXVjGlis2ECNQ.jpeg',
    'https://miro.medium.com/max/1440/1*LGK9zA-mEDXVjGlis2ECNQ.jpeg',
    'https://miro.medium.com/max/1440/1*LGK9zA-mEDXVjGlis2ECNQ.jpeg',
    'https://miro.medium.com/max/1440/1*LGK9zA-mEDXVjGlis2ECNQ.jpeg',
  ];

  void _onVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta > 3) {
      setState(() {
        _selected = false;
      });
    }
  }

  void _onTap() {
    if (_selected) {
      Modular.to.pushNamed('/detail', arguments: widget.item);
    } else {
      setState(() {
        _selected = !_selected;
      });
    }
  }

  Widget _buildStar({bool starSelected = true}) {
    return Icon(
      Icons.star,
      size: 15,
      color: starSelected ? Colors.blueAccent : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const duration = Duration(milliseconds: 300);
        final itemHeight =
            constraints.maxHeight * (widget.itemSelected ? 0.50 : 0.45);
        final itemWidth = constraints.maxWidth * 0.9;
        final backWidth = _selected ? itemWidth * 1.2 : itemWidth;
        final backHeigth = _selected ? itemHeight * 1.1 : itemHeight;
        final _borderRadius = BorderRadius.circular(10);

        return Center(
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onVerticalDragUpdate: _onVerticalDrag,
              onTap: _onTap,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      borderRadius: _borderRadius,
                      child: AnimatedContainer(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(
                            top: _selected ? itemHeight * 0.4 : 0),
                        width: backWidth,
                        height: backHeigth,
                        duration: duration,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('${widget.item.title}'),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(child: Text('NO.61419')),
                                  _buildStar(),
                                  _buildStar(),
                                  _buildStar(),
                                  _buildStar(),
                                  _buildStar(starSelected: false),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Row(
                                children: avatars
                                    .map((item) => Align(
                                          widthFactor: 0.85,
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundImage: NetworkImage(item),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: _borderRadius,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                              spreadRadius: 3)
                        ]),
                        margin: EdgeInsets.only(
                            bottom: _selected ? itemHeight * 0.1 : 0),
                        width: itemWidth,
                        height: itemHeight,
                        duration: duration,
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Hero(
                                tag: widget.item.title,
                                child: Image.network(
                                  widget.item.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  widget.item.title,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
