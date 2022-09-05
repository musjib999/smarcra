import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/shared/models/edit_data_timesheet_model.dart';
import 'package:smarcra/shared/themes/colors.dart';

import '../../../shared/widgets/buttons/action_button.dart';

class EditTimeSheet extends StatefulWidget {
  final int timeSheetId;
  const EditTimeSheet({Key? key, required this.timeSheetId}) : super(key: key);

  @override
  State<EditTimeSheet> createState() => _EditTimeSheetState();
}

class _EditTimeSheetState extends State<EditTimeSheet> {
  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Timesheet'),
      ),
      body: FutureBuilder<EditTimeSheetModel?>(
        future: si.timeSheetService
            .getEditTimeSheets(context, timeSheetId: widget.timeSheetId),
        builder: (context, snapshot) {
          EditTimeSheetModel? editTimeSheet = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError || editTimeSheet == null) {
            return Column(
              children: [
                SizedBox(height: 20.h),
                Center(
                    child: SvgPicture.asset(
                  'assets/svg/no-data.svg',
                  width: 50.w,
                )),
                SizedBox(height: 15.sp),
                const Text(
                  'No TimeSheet Available!',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 5.h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text('${editTimeSheet.resourceFirstName} ${editTimeSheet.resourceLastName}-${editTimeSheet.month}-${editTimeSheet.year}', style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),),
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: AdaptiveScrollbar(
                      controller: verticalScroll,
                      width: 10,
                      child: AdaptiveScrollbar(
                        controller: horizontalScroll,
                        width: 10,
                        position: ScrollbarPosition.bottom,
                        sliderDecoration: const BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        sliderActiveDecoration: const BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        underSpacing: const EdgeInsets.only(bottom: 8),
                        child: SingleChildScrollView(
                          controller: horizontalScroll,
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: const [
                              DataColumn(
                                label: Text('Name'),
                              ),
                              DataColumn(
                                label: Text('Mission'),
                              ),
                              DataColumn(
                                label: Text('Day'),
                              ),
                              DataColumn(
                                label: Text('Presence'),
                              ),
                              DataColumn(
                                label: Text('Absence'),
                              )
                            ],
                            rows: editTimeSheet.lines
                                .map(
                                  (item) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(
                                          '${editTimeSheet.contactFirstName} ${editTimeSheet.contactLastName}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          editTimeSheet.missionName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          item.dayCode,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          '${item.presence}d',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          '${item.leave}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () {},
                            child: const ActionButton(
                              title: 'Save',
                              icon: Icons.done,
                            )),
                      ),
                      SizedBox(width: 5.sp),
                      Expanded(
                        child: InkWell(
                            onTap: () {},
                            child: const ActionButton(
                              title: 'Cancel',
                              icon: Icons.close,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
