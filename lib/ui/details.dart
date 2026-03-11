import 'package:flutter/material.dart';
import 'package:quiz123230071/data/data_makanan.dart';


class Details extends StatefulWidget {
  final Food makan;
  const Details({super.key, required this.makan});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Food makan;
  final TextEditingController _jumlah = TextEditingController();
  String total = "Click The Chek Out button to see the price";
  int checkoutPressCount = 0;
  bool isCheckoutRed = false;
  bool tetott = false;
  @override
  void initState(){
    super.initState();
    makan = widget.makan;
    total = ("Total Harga : " + makan.price.toString());
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(makan.name),
      ),
      body: ListView(
        children: [
          Image.network(makan.image),
          Container(
            margin: EdgeInsets.fromLTRB(20,30,20,0),
            child: Text(makan.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight(800)),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20,0,20,10),
            child: Text("Kategori : " + makan.category),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
              Text(makan.description),
              Text("Harga : " + makan.price.toString()),
              Text("Kalori : "+ makan.calories.toString()),
              Text("Komposisi : " + makan.ingredients.join(", ")),
              Text("Recipe URL : " + makan.recipeUrl),
            ],),
          ),
          Container(
            margin: EdgeInsets.all(20) ,
            child: TextField(
              controller: _jumlah,
              onChanged: (value) {
                setState(() {
                  tetott = value.isNotEmpty && int.tryParse(value) == null;
                });
              },
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 62, 61, 61)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: tetott ? Colors.red : const Color.fromARGB(255, 62, 61, 61),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: tetott ? Colors.red : Colors.purple, width: 2),
                ),
                hint: Text("Example : 4"),
                label: Text("Quantity :")
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(total),
          ),
          Container(
            margin: EdgeInsets.all(20) ,
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  final qty = int.tryParse(_jumlah.text);
                  tetott = qty == null;
                  checkoutPressCount++;

                  if (!tetott) {
                    total = "Total Harga : " + (makan.price * qty!).toString();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Checkout berhasil! Total: Rp.${makan.price * qty}'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                    Future.delayed(Duration(seconds: 0), () {
                      Navigator.pop(context);
                    });
                  }
                });
              },
              child: Text("Check out"),
            )
          )
        ],
      ),
    );
  }
}