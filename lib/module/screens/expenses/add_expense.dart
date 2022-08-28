import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/service_injector.dart';
import '../../../shared/themes/colors.dart';
import '../../../shared/widgets/buttons/action_button.dart';
import '../../../shared/widgets/form/date_picker_container.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String selectedDocument = '';
  DateTime? startDate;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(12.sp),
        child: Column(
          children: [
            const Center(
              child: Text('Add Expense', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
            SizedBox(height: 20.sp),
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
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                hintText: 'Expense Type',
                hintStyle: TextStyle(
                  color: AppColors.greyText,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.greyText,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.greyText,
                  ),
                ),
              ),
                items: const [
                  DropdownMenuItem(value: 'Hostel Fee',child: Text('Hostel Fee'),)
                ],
                onChanged: (value){}
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
                child:  ListTile(
                  leading: const Icon(Icons.add_circle_outline),
                  title: Text(selectedDocument == '' ? 'Add Document' : selectedDocument, style: const TextStyle(
                    color: AppColors.greyText,
                  ),),
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
