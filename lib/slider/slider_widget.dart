import 'dart:async';

import 'package:flutter/material.dart';

/**
 * Created by daewubintara on
 * 27, June 2020 14.22
 */

class SliderWidget extends StatefulWidget {
  Function(int index) onTap;
  List<Widget> widgets;
  double indicatorSize;
  bool autoSlide;
  bool withIndicator;
  Color indicatorColorUnselected;
  int timeSliding;

  SliderWidget({
    @required this.onTap,
    @required this.widgets,
    this.indicatorSize,
    this.autoSlide,
    this.withIndicator,
    this.indicatorColorUnselected,
    this.indicatorColorSelected,
    this.timeSliding,
  });


  /** COLORS TYPE
   * @optional !!!
   * if null default value is Colors.blue
   * NO CALLBACK ON THIS PARAM || THIS IS NOT A FUNCTION !!!
   * */
  Color indicatorColorSelected;
  @override
  _SliderWidgetState createState() => _SliderWidgetState(
    onTap: onTap,
    widgets: widgets,
    autoSlide: autoSlide,
    indicatorColorSelected: indicatorColorSelected,
    indicatorColorUnselected: indicatorColorUnselected,
    indicatorSize: indicatorSize,
    withIndicator: withIndicator,
    timeSliding: timeSliding
  );
}

class _SliderWidgetState extends State<SliderWidget> with TickerProviderStateMixin {

  /** ON TAP ACTION WITH INDEX CALLBACK
   * @required !!!
   * @return onTap(index) { your function/method/etc... }
   * */
  Function(int index) onTap;

  /** ONLY WIDGET LIST OR WIDGET ON LIST GENERATE TO USE THIS!!!
   * @required !!!
   * NO CALLBACK ON THIS PARAM || THIS IS NOT A FUNCTION !!!
   * */
  List<Widget> widgets;

  /** DOUBLE TYPE TO RESIZE INDICATOR
   * @optional !!!
   * if null default size is 10.0
   * NO CALLBACK ON THIS PARAM || THIS IS NOT A FUNCTION !!!
   * */
  double indicatorSize;

  /** BOOLEAN TYPE
   * @optional !!!
   * if null default value is false
   * NO CALLBACK ON THIS PARAM || THIS IS NOT A FUNCTION !!!
   * */
  bool autoSlide;

  /** BOOLEAN TYPE
   * @optional !!!
   * if null default value is true
   * NO CALLBACK ON THIS PARAM || THIS IS NOT A FUNCTION !!!
   * */
  bool withIndicator;

  /** INTEGER TYPE
   * @optional !!!
   * if null default value is 3 second
   * NO CALLBACK ON THIS PARAM || THIS IS NOT A FUNCTION !!!
   * */
  int timeSliding;

  /** COLORS TYPE
   * @optional !!!
   * if null default value is Colors.grey[500]
   * NO CALLBACK ON THIS PARAM || THIS IS NOT A FUNCTION !!!
   * */
  Color indicatorColorUnselected;

  /** COLORS TYPE
   * @optional !!!
   * if null default value is Colors.blue
   * NO CALLBACK ON THIS PARAM || THIS IS NOT A FUNCTION !!!
   * */
  Color indicatorColorSelected;

  // PRIVATE !!!
  TabController _tabController;
  Timer _timer;


  _SliderWidgetState({
    @required this.onTap,
    @required this.widgets,
    this.indicatorSize,
    this.autoSlide,
    this.withIndicator,
    this.indicatorColorUnselected,
    this.indicatorColorSelected,
    this.timeSliding,
  }) {
    // SET DEFAULT VALUE
    if(indicatorSize == null) indicatorSize = 10.0 ;
    if(autoSlide == null ) autoSlide = false;
    if(withIndicator == null) withIndicator = true;
    if(indicatorColorUnselected == null) indicatorColorUnselected = Colors.grey[500];
    if(indicatorColorSelected == null) indicatorColorSelected = Colors.blue;
    if(timeSliding == null) timeSliding = 3;

    // SETUP TAB CONTROLLER

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: widgets.length,
      initialIndex: 0,
      vsync: this,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: timeSliding),
          (Timer timer) {
            if (autoSlide) {
              _autoSlide();
            }
          }
    );
  }

  void _autoSlide() {
    if(_tabController.index == widgets.length-1){
      _tabController.index = 0;
    } else {
      _tabController.index += 1;
    }
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widgets.length,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: itemWidgets(),
            ),
          ),
          !withIndicator ? Container() :
          Container(
            width: MediaQuery.of(context).size.width/2,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: indicatorColorSelected,
              unselectedLabelColor: indicatorColorUnselected,
              tabs: List.generate(widgets.length, (index) {
                return Icon(Icons.brightness_1, size: indicatorSize,);
              }),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> itemWidgets (){
    var list = List.generate(widgets.length, (index) {
      return GestureDetector(
        onTap: ()=>onTap(index),
        child: widgets[index],
      );
    });
    return list;
  }

}

