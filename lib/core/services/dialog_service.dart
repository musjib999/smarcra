import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DialogService {
  void bottomSheet(BuildContext context, {required Widget body}){
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
        ),
        builder: (context){
          return body;
        }
    );
  }

  void successSnackBar(BuildContext context, String message, bool isRejected){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(
      children: [
        isRejected == true ? const Icon( Icons.close_rounded, color: Colors.red,): const Icon( Icons.done, color: Colors.green,),
        SizedBox(width: 3.sp),
        Text(message)
      ],
    )));
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    DateTime? selectedDate;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960, 1),
        lastDate: DateTime(2050));
    if (picked != null) {
      selectedDate = picked;
      // isPicked = true;
      //get
    }
    return selectedDate;
  }

  Future<String> selectDoc() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      onFileLoading: (val) {},
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );
    String fileName = '';
    if (result != null) {
      fileName = result.files.first.name;
    }
    return fileName;
  }
}