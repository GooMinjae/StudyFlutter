import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalLiftFragment extends ConsumerStatefulWidget {
  const LocalLiftFragment({super.key});

  @override
  ConsumerState<LocalLiftFragment> createState() => _LocalLiftFragmentState();
}

class _LocalLiftFragmentState extends ConsumerState<LocalLiftFragment> {
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() {
      final floatingButtonState = ref.watch(floatingButtonStateProvider);

      if (scrollController.position.pixels > 100 &&
          !floatingButtonState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(true);
      } else if (scrollController.position.pixels < 100 &&
          floatingButtonState.isSmall) {
        ref.read(floatingButtonStateProvider.notifier).changeButtonSize(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(
          height: 500,
          color: Colors.orange,
        ),
        Container(
          height: 500,
          color: Colors.green,
        ),
        Container(
          height: 500,
          color: Colors.red,
        )
      ],
    );
  }
}
