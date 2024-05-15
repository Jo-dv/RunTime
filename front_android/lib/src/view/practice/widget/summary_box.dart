import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_android/src/service/theme_service.dart';
import 'package:front_android/util/lang/generated/l10n.dart';

class SummaryBox extends ConsumerWidget {
  const SummaryBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ref.color.battleBox,
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Distance',
                    style: ref.typo.subTitle1.copyWith(
                      color: ref.color.onBattleBox,
                      fontSize: 45,
                    ),
                  ),
                  Text(
                    'viewModel.date',
                    style: ref.typo.body1.copyWith(
                      color: ref.color.inactive,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    S.current.avgPace,
                    style: ref.typo.body1.copyWith(
                      color: ref.color.inactive,
                    ),
                  ),
                  Text(
                    'avgPace',
                    style: ref.typo.subTitle1.copyWith(
                      color: ref.color.onBattleBox,
                      fontSize: 35,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    S.current.caloryBurn,
                    style: ref.typo.body1.copyWith(
                      color: ref.color.inactive,
                    ),
                  ),
                  Text(
                    'calory',
                    style: ref.typo.subTitle1.copyWith(
                      color: ref.color.onBattleBox,
                      fontSize: 35,
                    ),
                  )
                ],
              )
            ],
          ),
          Text(
            S.current.runningTime,
            style: ref.typo.body1.copyWith(
              color: ref.color.inactive,
            ),
          ),
          Text(
            'runningTime',
            style: ref.typo.headline1.copyWith(
              color: ref.color.onBattleBox,
              fontSize: 60,
            ),
          )
        ],
      ),
    );
  }
}