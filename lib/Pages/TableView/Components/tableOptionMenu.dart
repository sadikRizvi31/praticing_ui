import 'package:flutter/material.dart';
import 'package:praticing_ui/Pages/ProfilePage/Components/saveButton.dart';

import 'package:praticing_ui/Pages/TableView/Components/dropDown.dart';
import 'package:praticing_ui/Pages/ProfilePage/Components/textInput.dart';
import 'package:praticing_ui/Utils/constants.dart';
import '../../../Widgets/customDialog.dart';

class tableOptionMenu extends StatelessWidget {

  final List<String> tableOptions;

  tableOptionMenu({required this.tableOptions});

  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = Theme.of(context);

    Future<void> createProductDialog(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return customDialog(
              title: "Create Product",
              button: saveButton(text: "Save"),
              childrens: [
                textInput(icon: Icons.production_quantity_limits, hintText: "Product Name"),
                dropDown(dropDownList: ['01','02','03','04','05'], hint: "Category ID", icon: Icons.account_tree_outlined),
                textInput(icon: Icons.inventory_2_outlined, hintText: "Quantity"),
                textInput(icon: Icons.currency_rupee_outlined, hintText: "Price"),
              ],
            );
          }
      );
    }

    Future<void> repairDeviceDetailsDialog(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return customDialog(
              title: "Fill Repair Device Details",
              button: saveButton(text: "Save"),
              childrens: [
                textInput(icon: Icons.phone_android_outlined, hintText: "Product Name"),
                textInput(icon: Icons.person_outline_sharp, hintText: "Product Holder Name"),
                textInput(icon: Icons.account_tree_outlined, hintText: "Category ID"),
                textInput(icon: Icons.report_problem_outlined, hintText: "Problem"),
                textInput(icon: Icons.phone_in_talk_rounded, hintText: "Phone Number"),
                textInput(icon: Icons.my_location_outlined, hintText: "Address"),
              ],
            );
          }
      );
    }

    Widget addText(String option){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(child: Text(option,style: themeData.textTheme.bodyText1),
            hoverColor: COLOR_GREY,
            onTap: (){
              if(option == 'Create Product'){
                createProductDialog(context);
              }
              if(option == 'Fill The Details'){
                repairDeviceDetailsDialog(context);
              }
            },
          ),
        Divider(height: 15,thickness: 1.5,),
        ],
      );
    }

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for(String value in tableOptions) addText(value),
          ],
        ),
      ),
    );
  }
}
