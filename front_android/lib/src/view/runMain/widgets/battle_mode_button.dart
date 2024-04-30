import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_android/src/service/theme_service.dart';
import 'package:front_android/theme/components/png_image.dart';
import 'package:front_android/util/lang/generated/l10n.dart';
import 'package:front_android/util/route_path.dart';

class BattleModeButton extends ConsumerWidget {
  const BattleModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      Navigator.pushNamed(context, RoutePath.matchingStart);
    }

    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRect(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        ref.color.battleMode1,
                        ref.color.battleMode2,
                      ],
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.battleMode,
                        style: ref.typo.headline1.copyWith(
                          color: ref.color.onBackground,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 150,
                            child: Transform.scale(
                              scale: 1.4,
                              child: Transform.translate(
                                offset: const Offset(0, 25),
                                child: const PngImage(
                                  'tier/pro_1',
                                  size: 200,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '등급',
                                      style: ref.typo.headline2.copyWith(
                                        color: ref.color.onBackground,
                                      ),
                                    ),
                                    Text(
                                      '점수',
                                      style: ref.typo.subTitle2.copyWith(
                                        color: ref.color.onBackground,
                                      ),
                                    ),
                                    Text(
                                      '상위 %',
                                      style: ref.typo.body2.copyWith(
                                        color: ref.color.lightText,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                '${S.current.enter} →',
                                style: ref.typo.headline1.copyWith(
                                  color: ref.color.onBackground,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
