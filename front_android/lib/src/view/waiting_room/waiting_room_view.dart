import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_android/src/service/theme_service.dart';
import 'package:front_android/src/view/waiting_room/waiting_room_view_model.dart';
import 'package:front_android/src/view/waiting_room/widget/participants_grid.dart';
import 'package:front_android/theme/components/button.dart';
import 'package:front_android/theme/components/image_background.dart';
import 'package:front_android/util/lang/generated/l10n.dart';

class WaitingRoomView {
  WaitingRoomView({required this.roomId});

  final int roomId;
}

class WaitingRoom extends ConsumerStatefulWidget {
  const WaitingRoom({
    required this.roomId,
    super.key,
  });

  final int roomId;

  @override
  ConsumerState<WaitingRoom> createState() => _WaitingRoomState();
}

class _WaitingRoomState extends ConsumerState<WaitingRoom> {
  late WaitingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getParticipants(widget.roomId);
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(waitingViewModelProvider);

    return BattleImageBackground(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          try {
            viewModel.roomOut(context);
          } catch (error) {
            debugPrint(error.toString());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                viewModel.roomOut(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: ref.color.onBackground,
                size: 30,
              ),
            ),
            centerTitle: true,
            title: Text(
              S.current.waitingRoom,
              style: ref.typo.appBarMainTitle.copyWith(
                color: ref.color.onBackground,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.title,
                  style: ref.typo.bigRegular.copyWith(
                    color: ref.color.onBackground,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  viewModel.distance,
                  style: ref.typo.headline1.copyWith(
                    color: ref.color.onBackground,
                  ),
                ),
                ParticipantsCartGrid(
                  participants: viewModel.participants,
                ),
                Button(
                  onPressed: () {},
                  text: viewModel.isManager
                      ? S.current.gameStart
                      : S.current.getReady,
                  backGroundColor: ref.color.accept,
                  fontColor: ref.color.onAccept,
                  isInactive: viewModel.canStart,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
