import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/product_post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/screen/main/tab/home/provider/post_provider.dart';
import 'package:fast_app_base/screen/post_detail/s_post_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen>
    with KeyboardDetector {
  final List<String> imageList = [picSum(442)];

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isLoding = false;

  @override
  void initState() {
    // TODO: implement initState
    titleController.addListener(() {
      setState(() {});
    });
    priceController.addListener(() {
      setState(() {});
    });
    descriptionController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '내 물건 팔기'.text.bold.make(),
        actions: [Tap(onTap: () {}, child: '임시저장'.text.make().p(15))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageSelectWidget(
              imageList,
              onTap: () {},
            ),
            _TitleEditor(titleController),
            const Height(30),
            _PriceEditor(priceController),
            const Height(30),
            _DescEditor(descriptionController),
          ],
        ).pSymmetric(h: 15),
      ),
      bottomSheet: isKeyboardOn
          ? null
          : RoundButton(
              text: isLoding ? '저장 중' : '작성 완료',
              bgColor: const Color(0xFFFB923C),
              isFullWidth: true,
              borderRadius: 10,
              isEnabled: isValid,
              rightWidget: isLoding
                  ? SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(),
                    ).pOnly(right: 80)
                  : null,
              onTap: () {
                AppKeyboardUtil.hide(context);
                final title = titleController.text;
                final price = int.parse(priceController.text);
                final desc = descriptionController.text;
                setState(() {
                  isLoding = true;
                });
                final list = ref.read(postProvider);
                final simpleProductPost = SimpleProductPost(
                    6,
                    user3,
                    Product(
                        user3, title, price, ProductStatus.normal, imageList),
                    title,
                    Address('감쟈시 감쟈구 감쟈동', '감쟈동'),
                    0,
                    0,
                    DateTime.now());
                ref.read(postProvider.notifier).state = List.of(list)
                  ..add(simpleProductPost);
                Nav.pop(context);
                Nav.push(PostDetailScreen(
                  simpleProductPost.id,
                  simpleProductPost: simpleProductPost,
                ));
              },
            ),
    );
  }

  bool get isValid =>
      isNotBlank(titleController.text) &&
      isNotBlank(priceController.text) &&
      isNotBlank(descriptionController.text);
}

class _ImageSelectWidget extends StatelessWidget {
  final List<String> imageList;
  final VoidCallback onTap;

  const _ImageSelectWidget(this.imageList, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: imageList.length.toString(),
                        style: TextStyle(color: Colors.orange)),
                    TextSpan(text: '/${10}')
                  ]))
                ],
              ).box.rounded.border(color: Colors.grey).make(),
            )
          ],
        ),
      ),
    );
  }
}

class _TitleEditor extends StatelessWidget {
  final TextEditingController controller;

  _TitleEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '제목'.text.bold.make(),
        const Height(5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: '제목',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        )
      ],
    );
  }
}

class _PriceEditor extends StatefulWidget {
  final TextEditingController controller;

  _PriceEditor(this.controller);

  @override
  State<_PriceEditor> createState() => _PriceEditorState();
}

class _PriceEditorState extends State<_PriceEditor> {
  bool isDonateMode = false;
  final priceNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '거래 방식'.text.bold.make(),
        const Height(10),
        Row(
          children: [
            RoundButton(
                theme: isDonateMode
                    ? RoundButtonTheme.whiteWithBlueBorder
                    : RoundButtonTheme.blue,
                text: '판매하기',
                onTap: () {
                  widget.controller.clear();
                  setState(() {
                    isDonateMode = false;
                  });
                  delay(() {
                    AppKeyboardUtil.show(context, priceNode);
                  });
                }),
            const Width(10),
            RoundButton(
                theme: !isDonateMode
                    ? RoundButtonTheme.whiteWithBlueBorder
                    : RoundButtonTheme.blue,
                text: '나눔하기',
                onTap: () {
                  widget.controller.text = "0";
                  setState(() {
                    isDonateMode = true;
                  });
                })
          ],
        ),
        const Height(10),
        TextField(
          focusNode: priceNode,
          controller: widget.controller,
          keyboardType: TextInputType.number,
          enabled: !isDonateMode,
          decoration: InputDecoration(
              // hintText: !isDonateMode ? '₩ 가격을 입력해주세요.' : '나눔 ❤️',
              hintText: '₩ 가격을 입력해주세요.',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        )
      ],
    );
  }
}

class _DescEditor extends StatelessWidget {
  final TextEditingController controller;

  _DescEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '자세한 설명'.text.bold.make(),
        const Height(5),
        TextField(
          controller: controller,
          maxLines: 7,
          decoration: InputDecoration(
              hintText: '자세한 설명',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        )
      ],
    );
  }
}
