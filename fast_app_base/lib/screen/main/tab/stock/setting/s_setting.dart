import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/data/preference/prefs.dart';
import 'd_number.dart';
import 'w_animated_app_bar.dart';
import 'w_switch_menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  late final AnimationController animateController =
      AnimationController(vsync: this, duration: 2000.ms);
  // bool isPushOn = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   isPushOn = Prefs.isPushOn.get();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: '설정'.text.make(),
      // ),
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 150),
            children: [
              // switch
              Obx(
                () => SwitchMenu(
                  '푸시 설정',
                  Prefs.isPushOnRx.get(),
                  onTap: (isOn) {
                    Prefs.isPushOnRx.set(isOn);
                  },
                ),
              ),
              // slider
              Obx(() => Slider(
                  value: Prefs.sliderPosition.get(),
                  onChanged: (value) {
                    animateController.animateTo(value, duration: 0.ms);
                    Prefs.sliderPosition.set(value);
                  })),

              // date time
              Obx(
                () => BigButton(
                    '날짜 ${Prefs.birthday.get() == null ? "" : Prefs.birthday.get()?.formattedDate}',
                    onTap: () async {
                  final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(90.days),
                      lastDate: DateTime.now().add(90.days));
                  if (date != null) {
                    Prefs.birthday.set(date);
                  }
                }),
              ),

              // number
              Obx(
                () =>
                    BigButton('저장된 숫자 ${Prefs.number.get()}', onTap: () async {
                  final number = await NumberDialog().show();
                  if (number != null) {
                    Prefs.number.set(number);
                  }
                }),
              ),

              // Open Source
              BigButton('애니메이션 forward', onTap: () async {
                // Nav.push(OpensourceScreen());
                animateController.forward();
              }),
              // Open Source
              BigButton('애니메이션 reverse', onTap: () async {
                animateController.reverse();
              }),
              // Open Source
              BigButton('애니메이션 repeat', onTap: () async {
                animateController.repeat();
              }),
              // Open Source
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              // Open Source
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              // Open Source
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              // Open Source
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              // Open Source
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              // Open Source
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              // Open Source
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              // Open Source
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              // // Open Source
              // BigButton('오픈소스 화면', onTap: () async {
              //   Nav.push(OpensourceScreen());
              // }),
              // // Open Source
              // BigButton('오픈소스 화면', onTap: () async {
              //   Nav.push(OpensourceScreen());
              // }),
            ],
          ),
          AnimatedAppBar(
            '설정',
            scrollController: scrollController,
            animationController: animateController,
          )
        ],
      ),
    );
  }
}
