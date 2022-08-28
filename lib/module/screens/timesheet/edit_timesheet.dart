import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/shared/models/timesheet_model.dart';
import 'package:smarcra/shared/themes/colors.dart';

import '../../../data/dummy_data.dart';
import '../../../shared/widgets/buttons/action_button.dart';

class EditTimeSheet extends StatefulWidget {
  final TimesheetModel timesheet;
  const EditTimeSheet({Key? key, required this.timesheet}) : super(key: key);

  @override
  State<EditTimeSheet> createState() => _EditTimeSheetState();
}

class _EditTimeSheetState extends State<EditTimeSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Timesheet'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.sp),
                  Text('${widget.timesheet.name}-${widget.timesheet.period}-2021', style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),),
                  const SizedBox(height: 15),
                  DataTable(
                    columns: const [
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Mission'),
                      ),
                      DataColumn(
                        label: Text('Period'),
                      ),
                      DataColumn(
                        label: Text('Presence'),
                      ),
                      DataColumn(
                        label: Text('Absence'),
                      )
                    ],
                    rows: editTimesheetData
                        .map(
                          (item) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              item.mission,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              item.period,
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
                              '${item.absence}d',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
            Container(
            margin: EdgeInsets.symmetric(horizontal: 8.sp),
            height: 19.h, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                    onTap: (){},
                    child: const ActionButton(title: 'Save', icon: Icons.done,)
                ),
              ),
              SizedBox(width: 5.sp),
              Expanded(
                child: InkWell(
                    onTap: (){},
                    child: const ActionButton(title: 'Cancel', icon: Icons.close,)
                ),
              ),
            ],
          ),),
        ],
      ),
    );
  }
}
