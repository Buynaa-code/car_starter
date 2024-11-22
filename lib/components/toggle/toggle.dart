import 'dart:ui'; // Import for BackdropFilter
import 'package:flutter/material.dart';

class ToggleTabView extends StatefulWidget {
  @override
  _ToggleTabViewState createState() => _ToggleTabViewState();
}

class _ToggleTabViewState extends State<ToggleTabView> {
  int _selectedIndex = 0; // Track the selected index for toggle buttons
  final List<String> _tabs = ['Tab 1', 'Tab 2', 'Tab 3'];

  Widget _buildToggleButton(String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Update selected index
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.grey[300] : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Overlay color
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Toggle Buttons Row
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      _tabs.length,
                      (index) => _buildToggleButton(_tabs[index], index),
                    ),
                  ),
                ),

                // Tab Content
                Expanded(
                  child: Center(
                    child: Text(
                      'You selected: ${_tabs[_selectedIndex]}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ToggleTabView()));
