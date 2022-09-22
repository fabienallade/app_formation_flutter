import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorTipsWidget extends StatefulWidget {
  num totalValue = 1;
  double amountValue = 1;
  double numberOfPerson = 1;
  double extra = 0;

  num totalValueCalcul() {
    totalValue = (amountValue + (amountValue * extra / 100)) / (numberOfPerson);
    return totalValue;
  }

  CalculatorTipsWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorTipsWidget> createState() => _CalculatorTipsWidgetState();
}

class _CalculatorTipsWidgetState extends State<CalculatorTipsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Tips Calculator",
            style: TextStyle(color: Colors.green, fontSize: 20),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: "0",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  widget.amountValue = double.parse(value);
                }
              });
            },
            decoration: const InputDecoration(
              labelText: "Amount €",
              hintText: "Amount",
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: "0",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: "Number of persons",
              hintText: "Number of persons",
            ),
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty && value != "0")
                  widget.numberOfPerson = double.parse(value);
              });
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: "0",
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: "Extra 1%",
              hintText: "extra",
            ),
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) widget.extra = double.parse(value);
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Total Per person: ",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '${widget.totalValueCalcul().toStringAsFixed(2)} €',
                style: const TextStyle(fontSize: 20, color: Colors.green),
              )
            ],
          )
        ],
      ),
    );
  }
}
