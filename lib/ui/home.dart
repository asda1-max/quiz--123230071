import 'package:flutter/material.dart';
import 'package:quiz123230071/data/data_makanan.dart';
import 'package:quiz123230071/ui/details.dart';
import 'package:quiz123230071/ui/login.dart';
import 'package:quiz123230071/ui/profile.dart';

class Home extends StatelessWidget {
  final String user;
const Home({ Key? key, required this.user });

  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + user + "!", style: TextStyle(fontSize: 20, fontWeight: FontWeight(800)),),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const loginpage()));
              ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Berhasil logout'),
                        duration: Duration(seconds: 5),
                      ),
                    );
            },
          )
        ],
      ),
      body: 
      ListView.builder(
        itemCount: dummyFoods.length,
        itemBuilder: (context, index) {
        Food item = dummyFoods[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(makan: item)));
          },
          child: 
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(border: BoxBorder.all(), borderRadius: BorderRadius.circular(2), color: const Color.fromARGB(66, 155, 155, 155)),
            child: ListTile(
            leading: 
            Container(
              width: 60,
              child: Image.network(item.image,fit: BoxFit.fill,errorBuilder:  (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                );
              },
               loadingBuilder: (BuildContext context, Widget child, [ImageChunkEvent? loadingProgress]) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
              ),
            ),
            
            title: Text(item.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rp." + item.price.toString()),
                Text(item.category)
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          )
          
        );
        
      },),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(username: user,)));
          }
        },
      ),
      );
  }
}