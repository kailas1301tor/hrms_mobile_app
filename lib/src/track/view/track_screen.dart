import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/src/track/view/widgets/advances_section.dart';
import 'package:hrms_mobile/src/track/view/widgets/filing_tab_selector.dart';
import 'package:hrms_mobile/src/track/view/widgets/leaves_section.dart';
import 'package:hrms_mobile/src/track/view/widgets/loans_section.dart';
import 'package:hrms_mobile/src/track/view/widgets/track_header.dart';
import 'package:hrms_mobile/utils/common_widgets/common_switch_state.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8F9FB),
      body: SafeArea(
        child: CommonSwitchState(
          loaderState: LoaderState.loaded,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TrackHeader(),
                ValueListenableBuilder<int>(
                  valueListenable: _selectedIndex,
                  builder: (context, value, child) {
                    return FilingTabSelector(
                      selectedIndex: value,
                      onTabSelected: (index) {
                        _selectedIndex.value = index;
                      },
                    );
                  },
                ),
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: _selectedIndex,
                    builder: (context, value, child) {
                      return _buildSection(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(int index) {
    switch (index) {
      case 0:
        return const LeavesSection();
      case 1:
        return const AdvancesSection();
      case 2:
        return const LoansSection();
      default:
        return const LeavesSection();
    }
  }
}
