import 'package:car_starter/components/const/colors.dart';
import 'package:car_starter/components/const/spacing.dart';
import 'package:car_starter/components/const/text_field.dart';
import 'package:car_starter/screens/main/alarm_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _alarms = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/home_bg.png',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Toyota Prius 40',
                        style: ktsBodyMassivePlus.copyWith(color: whiteColor)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildToggleButton('Асаах', true),
                        const SizedBox(width: 10),
                        _buildToggleButton('Унтраах', false),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 200, // Set an explicit height for the ListView
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(4.0),
                        itemCount: _alarms.length,
                        itemBuilder: (context, index) {
                          final alarm = _alarms[index];
                          return Card(
                            color: greyColor8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  24.0), // Ensure content fits
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Машин асаах цаг',
                                            style: ktsBodyMedium.copyWith(
                                                color: greyColor4),
                                          ),
                                          Text(
                                            '${alarm['time']}',
                                            style: ktsBodyMassivePlusBold
                                                .copyWith(color: whiteColor),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Switch(
                                            value: true,
                                            onChanged: (value) {
                                              // Handle switch change
                                            },
                                            activeColor: warningColor4,
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete,
                                                color: warningColor4),
                                            onPressed: () {
                                              setState(() {
                                                _alarms.removeAt(index);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  h24(),
                                  Row(children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Үргэлжлэх хугацаа',
                                          style: ktsBodySmall.copyWith(
                                              color: greyColor4),
                                        ),
                                        Text(
                                          '${alarm['duration']} минут',
                                          style: ktsBodyLargeBold.copyWith(
                                              color: greyColor1),
                                        ),
                                      ],
                                    ),
                                    w24(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Өдрүүд:',
                                          style: ktsBodySmall.copyWith(
                                              color: greyColor4),
                                        ),
                                        Text(
                                          '${alarm['days'].join(', ')}',
                                          style: ktsBodyLargeBold.copyWith(
                                              color: greyColor1),
                                        ),
                                      ],
                                    ),
                                  ])
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    h24(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              // Navigate to AlarmScreen and wait for the result
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlarmScreen(),
                                ),
                              );

                              // If the result is not null, add it to the alarms list
                              if (result != null && mounted) {
                                setState(() {
                                  _alarms.add(result as Map<String, dynamic>);
                                });
                              }
                            },
                            icon: const Icon(Icons.directions_car,
                                color: greyColor8),
                            label: Text(
                              'Цаг тохируулах',
                              style: ktsBodyMediumSemiBold.copyWith(
                                  color: greyColor8),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: greyColor2,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    h24(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isStartSelected = true;

  Widget _buildToggleButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isStartSelected = (label == 'Асаах');
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: (label == 'Асаах' && isStartSelected) ||
                  (label == 'Унтраах' && !isStartSelected)
              ? warningColor4
              : greyColor8,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          label,
          style: ktsBodyMediumBold.copyWith(
            color: (label == 'Асаах' && isStartSelected) ||
                    (label == 'Унтраах' && !isStartSelected)
                ? greyColor8
                : whiteColor,
          ),
        ),
      ),
    );
  }
}
