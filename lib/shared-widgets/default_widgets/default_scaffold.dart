import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';

import '../../shared-widgets/custom_nav_bar.dart';
import 'default_app_bar.dart';

class DefaultScaffold extends StatefulWidget {
  const DefaultScaffold(
      {this.title = "",
      this.showAppBar = true,
      this.isScrollable = false,
      this.backgroundColor = Colors.white,
      this.showBackButton = true,
      this.background,
      this.onPageChanged,
      this.pageIndex = 0,
      this.padding,
      required this.body,
      this.enablePaging = false,
      this.showSettings = false,
      this.addSpacing = true,
      Key? key})
      : super(key: key);
  final List<Widget> body;
  final int? pageIndex;
  final Widget? background;
  final Color? backgroundColor;
  final String title;
  final bool showAppBar,
      showBackButton,
      enablePaging,
      showSettings,
      isScrollable,
      addSpacing;

  final EdgeInsets? padding;
  final Function(int index)? onPageChanged;

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  late final PageController _pageController;
  late int _selectedPageIndex;
  List screensStack = [];

  @override
  void initState() {
    _selectedPageIndex = widget.pageIndex!;
    _pageController = PageController(initialPage: _selectedPageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: widget.enablePaging
              ? CustomNavBar(
                  onTap: navigationTapped,
                  selectedPageIndex: _selectedPageIndex,
                )
              : null,
          //title: "Inventory".toUpperCase(),

          body: body()),
    );
  }

  Widget body() {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
      child: Stack(
        children: [
          widget.background ??
              Container(
                //color: widget.backgroundColor,

                height:
                    getProportionateScreenHeight(SizeConfig.screenHeight / 2),
              ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.showAppBar)
                Align(
                  alignment: Alignment.topRight,
                  child: DefaultAppBar(
                    title: widget.title,
                    showBackButton: widget.showBackButton,
                    showSettings: widget.showSettings,
                  ),
                ),
              if (!widget.enablePaging && widget.addSpacing) Spacer(),
              if (widget.enablePaging)
                Flexible(
                  child: PageView(
                    //onPageChanged: onPageChanged,
                    controller: _pageController,
                    children: [
                      ...List.generate(
                          widget.body.length, (index) => widget.body[index]),
                    ],
                  ),
                ),
              if (!widget.enablePaging) ...widget.body
            ],
          ),
          /*if (!widget.enablePaging)
            Column(
              children: [...widget.body],
            ),*/
        ],
      ),
    );
  }

  void navigationTapped(int index) {
    if (index == 0 && screensStack.isNotEmpty) screensStack.clear();
    setState(() {
      _selectedPageIndex = index;
      widget.onPageChanged!(index);

      if (screensStack.contains(index)) {
        screensStack.remove(index);
      }
      screensStack.add(index);
    });
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
