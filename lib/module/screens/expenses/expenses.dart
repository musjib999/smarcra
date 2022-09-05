import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/module/screens/expenses/add_expense.dart';

import '../../../core/service_injector.dart';
import '../../../shared/models/expense_model.dart';
import '../../../shared/themes/colors.dart';
import '../../../shared/widgets/buttons/action_button.dart';
import '../../../shared/widgets/form/primary_text_field.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  late Future<List<ExpenseModel>> allExpenses;
  bool isActionButtonVisible = false;
  List<bool> _selected = [];
  ExpenseModel? _selectedExpense;

  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    allExpenses = si.expenseService.getExpenses(context);
    allExpenses.then((value) => _selected = List<bool>.generate(value.length, (int index) => false));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: FutureBuilder<List<ExpenseModel>>(
        future: allExpenses,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError || snapshot.data!.isEmpty) {
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
                  'No Expenses Available!',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            );
          }
          List<ExpenseModel> expenses = snapshot.data as List<ExpenseModel>;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: PrimaryTextField(
                  controller: TextEditingController(),
                  label: 'Search',
                  hintText: 'Search',
                  prefixIcon: Icons.search,
                ),
              ),
              SizedBox(
                height: 55.h,
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
                        borderRadius: BorderRadius.all(Radius.circular(12.0),
                        ),
                      ),
                      sliderActiveDecoration: const BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.all(Radius.circular(12.0),
                        ),
                      ),
                      underSpacing: const EdgeInsets.only(bottom: 10),
                      child: SingleChildScrollView(
                        controller: horizontalScroll,
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(
                              label: Text('Name'),
                            ),
                            DataColumn(
                              label: Text('Start'),
                            ),
                            DataColumn(
                              label: Text('Type'),
                            ),
                            DataColumn(
                              label: Text('Amount'),
                            ),
                            DataColumn(
                              label: Text('Status'),
                            )
                          ],
                          rows: expenses.map(
                                (expense) => DataRow(
                              selected: _selected[expenses.indexOf(expense)],
                              onSelectChanged: (value){
                                setState(() {
                                  _selected[expenses.indexOf(expense)] = value!;
                                  isActionButtonVisible = _selected[expenses.indexOf(expense)];
                                  _selectedExpense = expense;
                                });
                              },
                              color: MaterialStateProperty.all(_selected[expenses.indexOf(expense)] == true ? AppColors.primaryColor.withOpacity(0.3): Colors.white54),
                              cells: [
                                DataCell(Text('${expense.resourceFirstName} ${expense.resourceLastName}')),
                                DataCell(Text('${expense.year}-${expense.month}')),
                                DataCell(Text(expense.nbExpense.toString())),
                                DataCell(Text('${expense.totalAmount} USD')),
                                DataCell(Text(expense.status)),
                              ],
                            ),
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              isActionButtonVisible == true ?  Container(
                margin: EdgeInsets.symmetric(horizontal: 8.sp),
                height: 7.h, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: (){
                          si.dialogService.successSnackBar(context, 'Expense Rejected', false);
                        },
                        child: const ActionButton(title: 'Validate', icon: Icons.done,)
                    ),
                  ),
                  SizedBox(width: 5.sp),
                  Expanded(
                    child: InkWell(
                        onTap: (){
                          si.dialogService.successSnackBar(context, 'Expense Rejected', true);
                        },
                        child: const ActionButton(title: 'Reject', icon: Icons.close,)
                    ),
                  ),
                ],
              ),) : Container(),
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          si.dialogService.bottomSheet(
            context,
            body: const AddExpense(),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
