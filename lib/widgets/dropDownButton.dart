import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownButtonWidgets extends StatelessWidget {
  String? selectedValue;
  final List<String> items;
  final String selectedItemsText;
  final Function(String?) onSelected;

  DropDownButtonWidgets({
    super.key,
    required this.items,
    required this.selectedItemsText,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            selectedItemsText,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            onSelected(value);
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
