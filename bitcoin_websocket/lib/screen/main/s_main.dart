import 'dart:convert';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/widget/animated_number_text.dart';
import 'package:fast_app_base/common/widget/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:live_background/live_background.dart';
import 'package:live_background/object/particle_shape_type.dart';
import 'package:live_background/widget/live_background_widget.dart';
import 'package:web_socket_channel/io.dart';

import '../../common/common.dart';
import 'w_menu_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final wsUrl = Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade');
  late final channel = IOWebSocketChannel.connect(wsUrl);

  late final Stream<dynamic> stream; // channel에서 stream값을 websocket을 통해 받아오기

  String priceString = 'Loading';
  final List<double> priceList = [];

  final intervalDuration = 1.seconds;
  DateTime lastUpdatedTime = DateTime.now();

  @override
  void initState() {
    stream = channel.stream;
    stream.listen((event) {
      final obj = json.decode(event);
      final double price = double.parse(obj['p']); // String을 double로 parse
      if (DateTime.now().difference(lastUpdatedTime) > intervalDuration) {
        setState(() {
          lastUpdatedTime = DateTime.now();
          priceList.add(price);
          // priceString = obj['p']; // setState 밖에서 수행하여도 결과는 동일 (sync)
          priceString = price.toDoubleStringAsFixed(); // default : 소수점 두자리
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      body: Stack(
        children: [
          const LiveBackgroundWidget(
            shape: ParticleShapeType.square,
            velocityY: -7,
            particleMinSize: 5,
            particleMaxSize: 25,
            particleCount: 3000,
            palette: Palette(colors: [
              Color(0xff165B33),
              Color(0xff83ec00),
            ]),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedNumberText(
                    priceString,
                    textStyle:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    duration: 50.ms,
                  ),
                  LineChartWidget(
                    priceList,
                    maxPrice: 95000,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
