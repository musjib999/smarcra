import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/shared/widgets/form/date_picker_container.dart';

import '../../../shared/themes/colors.dart';
import '../../../shared/widgets/buttons/action_button.dart';

class AddLeave extends StatefulWidget {
  const AddLeave({Key? key}) : super(key: key);

  @override
  State<AddLeave> createState() => _AddLeaveState();
}

class _AddLeaveState extends State<AddLeave> {
  DateTime? startDate;
  DateTime? stopDate;

  String selectedDocument = '';

  bool martin = false;
  bool martin1 = false;

  bool soir = false;
  bool soir1 = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(12.sp),
        child: Column(
          children: [
           const Center(
              child: Text('Add Leave', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
            SizedBox(height: 18.sp),
            InkWell(
              onTap: ()async{
                DateTime? date = await si.dialogService.selectDate(context);
                setState(() {
                  startDate = date;
                });
              },
              child: DatePickerContainer(
                  date: startDate == null ? 'Pick Your date' : '${startDate!.day}-${startDate!.month}-${startDate!.year}'
              ),
            ),
            SizedBox(height: 10.sp),
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: martin,
                      side: const BorderSide(color: AppColors.greyText),
                      onChanged: (val) {
                        setState(() {
                          martin = val!;
                        });
                      },
                    ),
                    const Text(
                      'Martin',
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 6.sp),
                Row(
                  children: [
                    Checkbox(
                      value: soir,
                      side: const BorderSide(color: AppColors.greyText),
                      onChanged: (val) {
                        setState(() {
                          soir = val!;
                        });
                      },
                    ),
                    const Text(
                      'Soir',
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.sp),
            InkWell(
              onTap: ()async{
                DateTime? date = await si.dialogService.selectDate(context);
                setState(() {
                  stopDate = date;
                });
              },
              child: DatePickerContainer(
                  date: stopDate == null ? 'Pick Your date' : '${stopDate!.day}-${stopDate!.month}-${stopDate!.year}'
              ),
            ),
            SizedBox(height: 5.sp),
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: martin1,
                      side: const BorderSide(color: AppColors.greyText),
                      onChanged: (val) {
                        setState(() {
                          martin1 = val!;
                        });
                      },
                    ),
                    const Text(
                      'Martin',
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 6.sp),
                Row(
                  children: [
                    Checkbox(
                      value: soir1,
                      side: const BorderSide(color: AppColors.greyText),
                      onChanged: (val) {
                        setState(() {
                          soir1 = val!;
                        });
                      },
                    ),
                    const Text(
                      'Soir',
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.sp),
            InkWell(
              onTap: () async{
                String document =  await si.dialogService.selectDoc();
                setState(() {
                  selectedDocument = document;
                });
              },
              child: DottedBorder(
                color: AppColors.greyText,
                  dashPattern: const [6, 3, 2, 3],
                borderType: BorderType.RRect,
                radius: const Radius.circular(5.0),
                  child:  SizedBox(
                    child:  ListTile(
                      leading: const Icon(Icons.add_circle_outline),
                        title: Text(selectedDocument == '' ? 'Add Document' : selectedDocument, style: const TextStyle(
                        color: AppColors.greyText,
                        ),),
                        ),
                      ),
                  ),
            ),
            SizedBox(height: 8.sp),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.sp),
              height: 15.h, child: Row(
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
            SizedBox(height: 8.sp),
          ],
        ),
      ),
    );
  }
}
