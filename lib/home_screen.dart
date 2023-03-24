import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>  {
  bool addYourBuddy=false;
  bool referralAccepted=false;
  bool setHeight=false;
  final enterCode = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String enterCodeValue;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onWillPop, child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding:const EdgeInsets.all(10),
        child:Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background-with-open-gift.png"),
                      ),
                      color: Colors.white
                  )),
            ),
            referralAccepted==true?
            Positioned(
                top: 30,
                child:AnimatedSize(
                    clipBehavior: Clip.hardEdge,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.transparent
                        ),
                        padding: const EdgeInsets.only(right: 20),
                        child:Column(
                          children:const [
                            Image(image: AssetImage('assets/images/giftbox.png'),height: 125,width: 180,),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.transparent
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      referralAccepted=false;
                                    });
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: const Icon(Icons.close,color: Colors.white),
                                ),
                              ),
                            )
                        ),
                      ),
                      const Image(image: AssetImage('assets/images/party-emoji.gif'),height: 125,width: 180,),
                      const Text('Your Referral Code \nAccepted',textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ],

                  )),
            ):
            Positioned(
              top: 30,
              child: SizedBox(
                child:Container(
                  width: MediaQuery.of(context).size.width-30,
                  decoration: const BoxDecoration(
                      color: Colors.transparent
                  ),
                  child: Column(
                    children:[
                      const Image(image: AssetImage('assets/images/giftbox.png'),height: 120),
                      const Text('Enter \nReferal Code',textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      const Image(image: AssetImage('assets/images/gifts.png'),height: 100,),
                      const Text('Enter Code',textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                          key: _formKey,
                          child: SizedBox(
                              width: 180,
                              height:setHeight?75:60,
                              child: TextFormField (
                                validator: (text) {
                                  if (enterCodeValue.isEmpty) {
                                    return '             Text is empty';
                                  }
                                  return null;
                                },
                                controller: enterCode,
                                style: const TextStyle(fontSize: 16.0 ,color: Colors.black),
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '0000 0000 0000',
                                  filled: true,
                                  fillColor: Colors.pink.shade50,
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(width: 1, color: Colors.white), //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(50.0)),
                                  focusedBorder: OutlineInputBorder( borderSide:
                                  const BorderSide(width: 1, color: Colors.white), //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(50.0)),
                                  errorBorder:OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(width: 1, color: Colors.white), //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(50.0)),
                                  focusedErrorBorder: OutlineInputBorder( borderSide:
                                  const BorderSide(width: 1, color: Colors.white), //<-- SEE HERE
                                      borderRadius: BorderRadius.circular(50.0)),
                                ),
                              ))),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          enterCodeValue = enterCode.text ;
                          // Checking all TextFields.
                          if (_formKey.currentState!.validate())
                          {
                            // Put your code here which you want to execute when Text Field is Empty.
                            setState(() {
                              addYourBuddy=true;
                              setHeight=true;
                            });
                            addYourBuddyFunc();
                          }
                          else{
                            setState(() {
                              setHeight=true;
                            });
                          }
                        },
                        child: Container(
                            height:40,
                            width: 140,
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xff7B61FF),
                              border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(0),
                            ),
                            child: const Center(
                              child: Text(
                                  'Add Your Buddy',
                                  style: TextStyle(color: Colors.white, fontSize: 13.0),textAlign: TextAlign.center
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
  addYourBuddyFunc(){
    if(addYourBuddy==true){
      setState(() {
        referralAccepted=true;
      });
    }
    else{
      setState(() {
        referralAccepted=false;
      });
    }
  }
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content:  const Text('Do you want to go back to initial page'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'), // <-- SEE HERE
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }
}
