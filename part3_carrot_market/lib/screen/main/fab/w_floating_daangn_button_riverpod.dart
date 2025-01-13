import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'w_floating_daangn_button.state.dart';

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    const FloatingButtonState(false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  bool needToMakeButtonBigger = false;

  void toggleMenu() {
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;

    // state = state.copyWith(
    //     isExpanded: !state.isExpanded,
    //     isSmall: needToMakeButtonBigger ? false : true);

    // if (needToMakeButtonBigger) {
    //   needToMakeButtonBigger = false;
    // }

    // if (!isSmall && !isExpanded) {
    //   needToMakeButtonBigger = true;
    // }
    state = state.copyWith(
        isExpanded: !state.isExpanded,
        isSmall: needToMakeButtonBigger ? false : true);

    if (needToMakeButtonBigger) {
      needToMakeButtonBigger = false;
    }
    if (!isSmall && !isExpanded) {
      needToMakeButtonBigger = true;
    }
  }

  void changeButtonSize(bool isSmall) {
    if (state.isExpanded) {
      return;
    }

    state = state.copyWith(isSmall: isSmall);
  }
}
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class FloatingButtonState {
//   bool isExpanded;
//   bool isSmall;

//   FloatingButtonState()
//       : isExpanded = false,
//         isSmall = false;
// }

// final floatingButtonStateProvider =
//     StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
//   (ref) => FloatingButtonStateNotifier(
//     FloatingButtonState(),
//   ),
// );

// class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
//   FloatingButtonStateNotifier(super.state);

//   @override
//   bool updateShouldNotify(
//       FloatingButtonState old, FloatingButtonState current) {
//     // TODO: implement updateShouldNotify
//     return true;
//   }

//   void onTapButton() {
//     // state.isExpanded = !state.isExpanded;
//     // state.isSmall = true;
//     // ==
//     state = state
//       ..isExpanded = !state.isExpanded
//       ..isSmall = true;
//   }

//   void changeButtonSize(bool isSmall) {
//     state = state..isSmall = isSmall;
//   }
// }

// // final floatingButtonIsExpandedProvider = StateProvider((ref) => false);
// // final floatingButtonIsSmallProvider = StateProvider((ref) => false);

