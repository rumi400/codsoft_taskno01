import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {

  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  String _selectedDate = "";
  String _selectedTime = "";

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          ElevatedButton(
            onPressed: (){
              _selectTime(context: context,
                  callBack: (date, time)
                  {
                    setState(() {
                      _selectedTime = time;
                      _selectedDate = date;

                    });
                  }
              );

            },
            child: const Text("Time & Date Picker")
          ),
          const SizedBox(height: 20,),
          Text("$_selectedDate  $_selectedTime"),
        ],
      );

  }
  Future _selectTime ({required BuildContext context,required Function(String, String) callBack}) async{
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2200)
    );
    var t = DateTime.now();
    var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(t)
    );
    if(time != null && date != null)
    {
      callBack("${date.day}-${date.month}-${date.year}", time.format(context).toString());

    }
  }
}
