
import 'package:flutter/material.dart';
import 'package:flutter_dribbble_gallery/challenges/dragthis/album_details_page.dart';
import 'package:flutter_dribbble_gallery/challenges/dragthis/expandable.dart';
import 'package:flutter_dribbble_gallery/challenges/dragthis/theme.dart';

import 'album_card.dart';
import 'data/Album.dart';
import 'drag_this_toolbar.dart';

class DragThisPage extends StatefulWidget {
  const DragThisPage({Key? key}) : super(key: key);

  @override
  State<DragThisPage> createState() => _DragThisPageState();
}

class _DragThisPageState extends State<DragThisPage> {
  late PageController _pageController;

  double _currentPage = 0;
  Map<int, double> _pageHeight = Map();
  double _currentVerticalOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
    _pageController.addListener(() {
      setState(() {
        _currentPage = ((_pageController.page ?? 0));
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: DragThisTheme.data,
      child: Scaffold(
        backgroundColor: Color(0xFFD7D7D1),
        body: SafeArea(
          child: _gestureDetector(),
        ),
      ),
    );
  }

  Widget _gestureDetector() {
    return GestureDetector(
      onVerticalDragStart: (details) {
        debugPrint("🪂 $_currentVerticalOffset");
        setState(() {
          _currentVerticalOffset = 0;
        });
      },
      onVerticalDragUpdate: (details) {
        debugPrint("🥋 $_currentVerticalOffset");
        setState(() {
          if (_currentVerticalOffset + details.delta.dy > 0)
            _currentVerticalOffset += details.delta.dy;
        });
      },
      onVerticalDragEnd: (details) {
        debugPrint("🥏 END");
        Navigator.of(context).push(_createRoute()).then((value) => setState(() {
              _currentVerticalOffset = 0;
            }));
      },
      child: _body(),
    );
  }

  Widget _body() {
    final albumList = Album.opethAlbums();
    return Stack(
      children: [
        DragThisToolbar(context: context),
        PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            final double offsetFromCurrentCardInPercent = (index - _currentPage).abs();
            final double heightOffset = offsetFromCurrentCardInPercent * 200 > 200 ? 200 : offsetFromCurrentCardInPercent * 200;
            return Padding(
              padding: EdgeInsets.only(
                  top: 64 + _currentVerticalOffset / (offsetFromCurrentCardInPercent + 1)),
              child: OverflowBox(
                minHeight: 0,
                maxHeight: double.infinity,
                alignment: Alignment.topCenter,
                child: SizeReportingWidget(
                  onSizeChange: (value) {
                    setState(() {
                      _pageHeight[index] = value.height;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal:
                            4 + 4 / (1 + (_currentVerticalOffset / 100))),
                    child: AlbumCard(
                      album: albumList[index],
                      heightOffset: heightOffset,
                      offsetFromCurrentCardInPercent: offsetFromCurrentCardInPercent + _currentVerticalOffset / 400,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: albumList.length,
        ),
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AlbumDetailsPage(
        album: Album.opethAlbums()[_currentPage.floor()],
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
