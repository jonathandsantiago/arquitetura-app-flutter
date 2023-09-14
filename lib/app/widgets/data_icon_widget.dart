import 'package:seedapp/app/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DataIconWiget extends StatefulWidget {
  final String labelText;

  const DataIconWiget({super.key, required this.labelText});

  @override
  DataIconWigetState createState() => DataIconWigetState();
}

class DataIconWigetState extends State<DataIconWiget> {
  TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return paymentDateWidget(context, dateController,
        labelText: widget.labelText);
  }
}

Widget paymentDateWidget(
    BuildContext context, TextEditingController dateController,
    {required String labelText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/svg/icons/icon_data_de_pagamento.svg',
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                  ThemeApp.of(context).primaryText, BlendMode.srcIn),
            ),
            const SizedBox(width: 8.0),
            Text(
              'Data de Pagamento',
              style: ThemeApp.of(context).titulo.override(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          initialValue: DateFormat('dd/MM/yyyy').format(DateTime.now()),
          onTap: () async {
            // DateTime? pickedDate = await showDatePicker(
            //   context: context,
            //   initialDate: DateTime.now(),
            //   firstDate: DateTime(2000),
            //   lastDate: DateTime(2101),
            // );
            // TODO: implementar o setState
            //if (pickedDate != null) {
            //  setState(() {
            //    dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
            //  });
            //}
          },
          // controller: dateController, TODO: implementar o controller
          readOnly: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: ThemeApp.of(context).primary,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeApp.of(context).secondary.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ThemeApp.of(context).secondary.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          style: TextStyle(
            color: ThemeApp.of(context).secondary,
          ),
        ),
      ],
    ),
  );
}
