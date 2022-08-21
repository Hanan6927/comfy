import 'package:comfy/models/item_type.dart';
import 'package:comfy/presentation/core/constants.dart';
import 'package:flutter/material.dart';

class ItemSize extends StatefulWidget {
  List<ItemType> list;
  ItemSize({Key? key, required this.list}) : super(key: key);

  @override
  State<ItemSize> createState() => _ItemSizeState();
}

class _ItemSizeState extends State<ItemSize> {
  String? dropdownvalue = 'Red';
  int? color_num;
  int? size_num;

  String? size = "XL";
  int? quantity;

  @override
  Widget build(BuildContext context) {
    // List of items in our dropdown menu
    var colors = [
      'Red',
      'Green',
      'White',
      'Blue',
      'Silver',
    ];
    var sizes = [
      "XL",
      "XXL",
      "S",
      "L"
    ];
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              // Initial Value
              value: dropdownvalue,
        
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              hint: Text("Color"),
              // Array list of items
              items: colors.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: normalStyle,
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  if ( newValue == 'Red')
                  color_num = 1;
                  if ( newValue == 'Green')
                  color_num = 2;
                  if ( newValue == 'White')
                  color_num = 3;
                  if ( newValue == 'Blue')
                  color_num = 4;
                  if ( newValue == 'Silver')
                  color_num = 5;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              // Initial Value
              value: size,
        
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              hint: Text("Color"),
              // Array list of items
              items: sizes.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: normalStyle,
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  size = newValue!;
                  if ( newValue == 'XL')
                  size_num = 1;
                  if ( newValue == 'XXL')
                  size_num = 2;
                  if ( newValue == 'S')
                  size_num = 3;
                  if ( newValue == 'L')
                  size_num = 4;

                  widget.list.forEach((element) {
                    if (element.color == color_num && element.size == size_num){
                      quantity = element.quantity;
                      print(size_num);
                      print(quantity);

                    }
                    else{
                      quantity = null;
                    }
                  })
                  ;
                });
              },
            ),
          ),
        ),
        Expanded(child: Padding(padding: const EdgeInsets.all(8.0),child: Text("Quantity"),)),
        Expanded(child: Padding(padding: const EdgeInsets.all(8.0),child: quantity == null ? Text("0") :Text('$quantity'),))

      ],
    );
  }
}
