import 'package:flutter/material.dart';
import 'package:magazine_v1/utilities/hex_color.dart';
import 'package:magazine_v1/widget/custom_back_button.dart';

// ignore: must_be_immutable
class MagazineSliverAppBar extends StatelessWidget {
  MagazineSliverAppBar({
    Key? key,
    required this.body,
    required this.title,
    this.drawer,
    this.imageUrl,
    this.footer,
  }) : super(key: key);

  final Widget body;
  final Widget? footer;
  final String title;
  final Widget? drawer;
  final String? imageUrl;

  var top = 0.0;
  bool scrolled = false;

  @override
  Widget build(BuildContext context) {
    var navBarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          child: Scaffold(
            body: Container(
              color: Colors.white,
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      elevation: 0,
                      leading: const CustomBackButton(),
                      leadingWidth: 110,
                      expandedHeight: 400.0,
                      floating: false,
                      pinned: true,
                      title: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      flexibleSpace: LayoutBuilder(
                        builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                        ) {
                          top = constraints.biggest.height;
                          scrolled = (top == navBarHeight);
                          return FlexibleSpaceBar(
                            centerTitle: true,
                            titlePadding: const EdgeInsets.only(bottom: 0),
                            background: Hero(
                              tag: imageUrl!,
                              transitionOnUserGestures: true,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 50),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(35),
                                    bottomRight: Radius.circular(35),
                                  ),
                                  child: Image.network(
                                    imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      backgroundColor: HexColor('#f3f5f9'),
                      iconTheme: const IconThemeData(
                        color: Colors.black, //change your color here
                      ),
                    ),
                  ];
                },
                body: SafeArea(
                  top: false,
                  bottom: false,
                  child: Container(
                    color: HexColor('#f3f5f9'),
                    child: Column(
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              body,
                              Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minHeight: 50,
                                          minWidth: double.infinity,
                                          maxHeight: 200.0,
                                          maxWidth: double.infinity,
                                        ),
                                        child: footer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.95),
        );
      },
    );
  }
}
