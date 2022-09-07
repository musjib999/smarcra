import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/service_injector.dart';
import '../../../shared/themes/colors.dart';
import '../../../shared/widgets/buttons/action_button.dart';
import '../../../shared/widgets/buttons/secondary_button.dart';
import '../../../shared/widgets/form/date_picker_container.dart';
import '../../../shared/widgets/form/primary_text_field.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController amount = TextEditingController();
  String selectedDocument = '';
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Add Expense',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              PrimaryTextField(
                prefixIcon: Icons.text_format,
                controller: amount,
                label: 'Amount',
                hintText: 'Enter amount',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 18.sp),
              InkWell(
                onTap: () async {
                  DateTime? date = await si.dialogService.selectDate(context);
                  setState(() {
                    selectedDate = date;
                  });
                },
                child: DatePickerContainer(
                    date: selectedDate == null
                        ? 'Pick Your date'
                        : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}'),
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
                  DropdownMenuItem(
                    value: 'Hostel Fee',
                    child: Text('Hostel Fee'),
                  )
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 8.sp),
              InkWell(
                onTap: () async {
                  String document = await si.dialogService.selectDoc();
                  setState(() {
                    selectedDocument = document;
                  });
                },
                child: DottedBorder(
                  color: AppColors.greyText,
                  dashPattern: const [6, 3, 2, 3],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(5.0),
                  child: ListTile(
                    leading: const Icon(Icons.add_circle_outline),
                    title: Text(
                      selectedDocument == ''
                          ? 'Add Document'
                          : selectedDocument.split('/')[selectedDocument.split('/').length -1],
                      style: const TextStyle(
                        color: AppColors.greyText,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.sp),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.sp),
                height: 15.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        title: 'Save',
                        icon: Icons.done,
                        onTap: (startLoading, stopLoading, btnState) async {
                          if(selectedDocument == '' || selectedDate == null){
                            si.dialogService.successSnackBar(context, 'Please select a document and date', true);
                          }else{
                            startLoading();
                            Uint8List file =
                            await File(selectedDocument).readAsBytes();
                           final expense = await si.expenseService.addExpense(
                              context: context,
                              amount: double.parse(amount.text),
                              date: selectedDate!,
                              file: base64Encode(file),
                            );
                           if(expense == null){
                             si.dialogService.successSnackBar(context, 'Could not add expense, please try again later', true);
                           }else if(expense.id == 0){
                             stopLoading();
                           }else{
                             stopLoading();
                             setState(() {
                               si.dialogService.successSnackBar(context, 'Expense added successfully', false);
                               amount.clear();
                               selectedDocument = '';
                               selectedDate = null;
                             });
                           }
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 5.sp),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          si.routerService.popRoute(context);
                        },
                        child: const ActionButton(
                          title: 'Cancel',
                          icon: Icons.close,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.sp),
            ],
          ),
        ),
      ),
    );
  }
}
