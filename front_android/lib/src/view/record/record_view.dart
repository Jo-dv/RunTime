import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_android/src/view/record/record_view_model.dart';
import 'package:front_android/src/view/record/widgets/record/record_list.dart';
import 'package:front_android/src/view/record/widgets/record/record_top.dart';
import 'package:front_android/src/service/theme_service.dart'; // 테마 서비스를 위한 라이브러리

// 사용자 정의 위젯 및 로컬라이제이션을 위한 import
import 'package:front_android/theme/components/svg_icon.dart';
import 'package:front_android/util/lang/generated/l10n.dart';

class RecordView extends ConsumerStatefulWidget {
  const RecordView({super.key});

  @override
  ConsumerState<RecordView> createState() => _RecordViewState();
}

// 기록을 표시하는 위젯
class _RecordViewState extends ConsumerState<RecordView> {
  late RecordViewModel viewModel;

  @override
  void initState() {
    super.initState();
    // 위젯 빌드 후 실행(viewModel 받와야 사용 가능)
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.fetchRecordList(
        gameMode: "",
        pageSize: 10,
        lastId: 0,
      );
      print("--------[RecordView] initState --------");
      print(viewModel.recordList);
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(recordViewModelProvider); // 뷰 모델 가져오기
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.record,
          style: ref.typo.appBarMainTitle,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: SvgIcon('bell'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RecordTop(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: RecordList(
                recordList: viewModel.recordList,
                hasNext: viewModel.hasNext,
                lastId: viewModel.lastId,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
