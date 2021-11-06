import 'package:flutter/material.dart';

class Interface_Mail extends StatefulWidget{
  const Interface_Mail({Key?key}):super(key: key);

  @override
  _Interface_MailState createState() => _Interface_MailState();
}

class _Interface_MailState extends State<Interface_Mail>{
  List<Mail> mails=[
    Mail(Icons.mail,Colors.red,"All inboxes",98),
    Mail(Icons.cloud,Colors.blue,"Icloud",17),
    Mail(Icons.mail_outline,Colors.red,"Gmail",51),
    Mail(Icons.mail_rounded,Colors.red,"Hotmail",24),
    Mail(Icons.folder_special,Colors.red,"VIP",6),
    Mail(Icons.security,Colors.blue,"Secure",15),
    Mail(Icons.circle_notifications,Colors.red,"Notification",16),
  ];

  @override 
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width-35;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.blue;
    }
    
    Widget buildMailItems(int id,IconData icon, Color color, String lable, int number){
      return Container(
        padding: const EdgeInsets.only(top:5,bottom: 5),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: mails[id].isChecked,
              onChanged: (bool? value) {
                setState(() {
                  mails[id].isChecked = value!;
                });
              },
            ),
            Icon(
              icon,
              color: color,
            ),
            Expanded(
              child: Text(lable),
            ),
            Text(number.toString())
          ],
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text("Mailboxes"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: (){}, 
            child: const Text("Quay lại"),
            style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromRGBO(200, 200, 200, 100),
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              child: const Text(
                "Mailboxes",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10,right: 10),
              padding: const EdgeInsets.only(left: 20,right: 20),
              color: const Color.fromRGBO(240, 240, 240, 100),
              child: Column(
                children: [
                  buildMailItems(0, mails[0].icon, mails[0].color, mails[0].lable, mails[0].number),
                  buildMailItems(1, mails[1].icon, mails[1].color, mails[1].lable, mails[1].number),
                  buildMailItems(2, mails[2].icon, mails[2].color, mails[2].lable, mails[2].number),
                  buildMailItems(3, mails[3].icon, mails[3].color, mails[3].lable, mails[3].number),
                  buildMailItems(4, mails[4].icon, mails[4].color, mails[4].lable, mails[4].number),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: const Text(
                "Special folders",
                 style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10,right: 10),
              padding: const EdgeInsets.only(left: 20,right: 20),
              color: const Color.fromRGBO(240, 240, 240, 100),
              child:Column(
                children: [
                  buildMailItems(5, mails[5].icon, mails[5].color, mails[5].lable, mails[5].number),
                  buildMailItems(6, mails[6].icon, mails[6].color, mails[6].lable, mails[6].number),    
                ],
              )
            ),
            
          ],
        ),
      ),
      floatingActionButton: Positioned(
        bottom: 10,
        left: 50,
        child: OutlinedButton(
          onPressed: (){
            for(int i=0;i<7;i++){
              if(i==0&&mails[i].isChecked){
                i=4;
                for(int j=0;j<5;j++){
                  mails[j].isChecked=false;
                  mails[j].number=0;
                }
              }
              else if(mails[i].isChecked){
                mails[i].isChecked=false;
                mails[i].number=0;
              }
            }
            setState(() {});
          }, 
          child: const Text(
            "Delete",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => const Color.fromRGBO(200, 200, 200, 100)),
            fixedSize: MaterialStateProperty.resolveWith((states) =>  Size(width,50)),
          ),
        ),       
      ),                    
    );
  }
}

class Mail{
  Mail(IconData icon,Color color, String lable, int number){
    this.icon=icon;
    this.color=color;
    this.lable=lable;
    this.number=number;
  }
  
  bool isChecked=false;
  late IconData icon;
  late Color color;
  late String lable;
  late int number;
}