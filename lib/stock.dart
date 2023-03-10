import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
  // crate list of spots for the graph by monthly, yearly of Google Stocks
  List<FlSpot> _daylySpots = [
    FlSpot(0, 20.0),
    FlSpot(1, 20.0),
    FlSpot(2, 30.0),
    FlSpot(3, 10.0),
    FlSpot(4, 40.0),
    FlSpot(5, 60.0),
    FlSpot(6, 40.0),
    FlSpot(7, 80.0),
    FlSpot(8, 60.0),
    FlSpot(9, 70.0),
    FlSpot(10, 50.0),
    FlSpot(11, 150.0),
    FlSpot(12, 70.0),
    FlSpot(13, 80.0),
    FlSpot(14, 60.0),
    FlSpot(15, 70.0),
    FlSpot(16, 60.0),
    FlSpot(17, 80.0),
    FlSpot(18, 110.0),
    FlSpot(19, 130.0),
    FlSpot(20, 100.0),
    FlSpot(21, 130.0),
    FlSpot(22, 160.0),
    FlSpot(23, 190.0),
    FlSpot(24, 150.0),
    FlSpot(25, 170.0),
    FlSpot(26, 180.0),
    FlSpot(27, 140.0),
    FlSpot(28, 150.0),
    FlSpot(29, 150.0),
    FlSpot(30, 130.0)
  ];

  List<FlSpot> _monthlySpots = [
    FlSpot(0, 110.0),
    FlSpot(1, 110.0),
    FlSpot(2, 130.0),
    FlSpot(3, 100.0),
    FlSpot(4, 130.0),
    FlSpot(5, 160.0),
    FlSpot(6, 190.0),
    FlSpot(7, 150.0),
    FlSpot(8, 170.0),
    FlSpot(9, 180.0),
    FlSpot(10, 140.0),
    FlSpot(11, 150.0),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text("R and D"),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 10),
                FadeInUp(
                  duration: Duration(milliseconds: 1000),
                  from: 60,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: LineChart(
                        mainData(),
                        swapAnimationCurve: Curves.easeInOutCubic,
                        swapAnimationDuration: Duration(milliseconds: 1000),
                      )),
                ),
                AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = 0;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _currentIndex == 0
                                  ? Color(0xff161b22)
                                  : Color(0xff161b22).withOpacity(0.0),
                            ),
                            child: Text(
                              "D",
                              style: TextStyle(
                                  color: _currentIndex == 0
                                      ? Colors.blueGrey.shade200
                                      : Colors.blueGrey,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = 1;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _currentIndex == 1
                                  ? Color(0xff161b22)
                                  : Color(0xff161b22).withOpacity(0.0),
                            ),
                            child: Text(
                              "M",
                              style: TextStyle(
                                  color: _currentIndex == 1
                                      ? Colors.blueGrey.shade200
                                      : Colors.blueGrey,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = 2;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _currentIndex == 2
                                  ? Color(0xff161b22)
                                  : Color(0xff161b22).withOpacity(0.0),
                            ),
                            child: Text(
                              "Y",
                              style: TextStyle(
                                  color: _currentIndex == 2
                                      ? Colors.blueGrey.shade200
                                      : Colors.blueGrey,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    )),
              ]),
        ));
  }

  // Charts Data
  List<Color> gradientColors = [
    Color.fromARGB(255, 3, 145, 27),
    Color.fromARGB(255, 0, 161, 48),
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: false,
        horizontalInterval: 1.6,
        drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 1,
            getTitlesWidget: (value, meta) {
              return Text("1");
            },
            // getTitlesWidget: (value, meta) {

            // },
          ),
        ),
      ),
      minX: 0,
      maxX: _currentIndex == 0
          ? _daylySpots.length - 1.toDouble()
          : _currentIndex == 1
              ? _monthlySpots.length - 1.toDouble()
              : _currentIndex == 2
                  ? _daylySpots.length - 20.toDouble()
                  : _daylySpots.length.toDouble(),
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(
        
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Color(0xff2C61F3).withOpacity(0.3),
                strokeWidth: 2,
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Color(0xff4CB748),
                    Color(0xff4CB748),
                  ][index],
                  strokeWidth: 2,
                  strokeColor: Colors.black,
                ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: Color(0xff2e3747).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round()}.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _currentIndex == 0
              ? _daylySpots
              : _currentIndex == 1
                  ? _monthlySpots
                  : _daylySpots,
          isCurved: true,
          color: Color(0xff4CB748),
          // gradient: LinearGradient(colors: [
          //   Color.fromARGB(255, 0, 8, 4).withOpacity(1),
          //   Color.fromARGB(255, 0, 0, 0).withOpacity(1),
          // ]),
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, color: Colors.transparent
              // gradient: LinearGradient(
              //   colors: [
              //     Color.fromARGB(255, 6, 110, 24).withOpacity(0.4),
              //     Color.fromARGB(255, 35, 230, 67).withOpacity(0.1),
              //   ],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
              ),
        )
      ],
    );
  }
}
