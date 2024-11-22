import 'package:car_starter/components/const/colors.dart';
import 'package:car_starter/components/const/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  TimeOfDay _selectedTime = const TimeOfDay(hour: 0, minute: 0);
  int _selectedDuration = 5; // Default to 5 minutes
  final List<String> _days = [
    'Даваа',
    'Мягмар',
    'Лхагва',
    'Пүрэв',
    'Баасан',
    'Бямба',
    'Ням'
  ];
  final Set<String> _selectedDays = {};

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showCupertinoModalPopup<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          onTimerDurationChanged: (Duration duration) {
            setState(() {
              _selectedTime = TimeOfDay.fromDateTime(
                  DateTime(0, 0, 0, duration.inHours, duration.inMinutes % 60));
            });
          },
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveAndGoBack() {
    final selectedData = {
      'time': _selectedTime.format(context),
      'duration': _selectedDuration,
      'days': _selectedDays.toList(),
    };

    Navigator.pop(context, selectedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor9,
      appBar: AppBar(
        backgroundColor: greyColor9,
        elevation: 1,
        title: Text(
          'Машин асаах цаг',
          style: ktsBodyMassiveBold.copyWith(color: whiteColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: greyColor8,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: whiteColor),
                        const SizedBox(width: 8),
                        Text(
                          'Цаг сонгох',
                          style: ktsBodyMediumBold.copyWith(color: whiteColor),
                        ),
                      ],
                    ),
                    CupertinoButton(
                      child: Text(
                        _selectedTime.format(context),
                        style: ktsBodyLargeBold.copyWith(color: warningColor4),
                      ),
                      onPressed: () => _selectTime(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Duration Dropdown
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: greyColor8,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer, color: whiteColor),
                        const SizedBox(width: 8),
                        Text(
                          'Машины асах хугацааг сонгоно уу',
                          style: ktsBodyRegularSemiBold.copyWith(
                              color: whiteColor),
                        ),
                      ],
                    ),
                    DropdownButton<int>(
                      dropdownColor: greyColor8,
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      value: _selectedDuration,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: [5, 10, 15, 20, 30, 45, 60].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value минут',
                            style:
                                ktsBodyLargeBold.copyWith(color: warningColor4),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDuration = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Days Selection
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: greyColor8,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: whiteColor),
                        const SizedBox(width: 8),
                        Text(
                          'Өдрөө сонгоно уу',
                          style: ktsBodyMediumBold.copyWith(color: whiteColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: _days.map((day) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: ChoiceChip(
                            label: Text(day),
                            selected: _selectedDays.contains(day),
                            selectedColor: warningColor4,
                            backgroundColor: whiteColor,
                            labelStyle: ktsBodyRegular.copyWith(
                              color: _selectedDays.contains(day)
                                  ? greyColor8
                                  : greyColor7,
                            ),
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _selectedDays.add(day);
                                } else {
                                  _selectedDays.remove(day);
                                }
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  32), // Set the border radius
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: _saveAndGoBack,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: warningColor4,
                  ),
                  child: Text(
                    'Хадгалах',
                    style: ktsBodyLargeBold.copyWith(color: greyColor8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
