import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LandSize extends StatefulWidget {
  const LandSize({Key? key}) : super(key: key);

  @override
  State<LandSize> createState() => _LandSizeState();
}

class _LandSizeState extends State<LandSize> {

    String textvalue='';
    String land_type='';

    bool _isSelected2=false;
    bool _isSelected3=false;
    bool _isSelected4=false;
    bool _isSelected1=false;
    Future<void> sendInfo() async {

     try{
       final response = await http.post(
           Uri.parse('https://infoservice.nodesdigitalbd.com/api/v1/land_size/store'),
           headers: <String, String>{
             'Content-Type': 'application/json; charset=UTF-8',
           },
           body: jsonEncode(<String, String>{
             'size': textvalue,
             'land_type': land_type,
             'user_id': '1',
           })
       );
       if(response.statusCode==201){
         print('api calling is successsful......');
         final Map user_info = json.decode(response.body);
         print(user_info);
       }
       else{
         throw Exception('Request Error: ${response.statusCode}');
       }

     }
     on Exception{
        rethrow;
     }


    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Land Size',style:TextStyle(color:Colors.black ) ,),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading:  IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {}
          ),
        ),
      body: ListView(
        children: [
        const  SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.white,
                  boxShadow:const [
                    BoxShadow(
                      blurRadius: 2.0,
                      offset:  Offset(3.0, 2.0),
                      color: Colors.grey,
                    ),
                    BoxShadow(
                      blurRadius: 2.0,
                      offset: Offset(-3.0, -2.0),
                      color: Colors.grey,
                    )
                  ]),
              height: 45,
              width:200,
              //color: Colors.amberAccent,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.white,
                        boxShadow: const [
                           BoxShadow(
                            blurRadius: 2.0,
                            offset: Offset(3.0, 2.0),
                            color: Colors.grey,
                          ),
                           BoxShadow(
                            blurRadius: 2.0,
                            offset: Offset(-3.0, 0.0),
                            color: Colors.grey,
                          )
                        ]),

                   // color: Colors.amberAccent,
                    height: 45,
                    width: 170,
                    child: const Center(
                      child: Text('LAND SIZE',style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.white,
                          boxShadow:const [
                             BoxShadow(
                              blurRadius: 2.0,
                              offset:  Offset(3.0, 2.0),
                              color: Colors.grey,
                            ),
                             BoxShadow(
                              blurRadius: 2.0,
                              offset:  Offset(-3.0, 0.0),
                              color: Colors.grey,
                            )
                          ]),
                     // color: Colors.red,
                      height: 45,
                      width: 171,
                      child: Padding(
                        padding:const EdgeInsets.only(left: 35),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,


                          ),
                          onChanged: (value){
                            setState((){

                              textvalue=value;

                            });
                          },

                        ),
                      )
                     ),
                  ),
                ],
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(left:40.0),
              child: Column(

                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                               Row(
                                 children: [
                                GestureDetector(

                                       onTap: (){
                                              setState((){

                                               _isSelected1=!_isSelected1;
                                               _isSelected2=false;
                                               _isSelected3=false;
                                               _isSelected4=false;
                                               land_type='hector';

                                              });
                                                },
                                     child:  Container(
                                       height: 30,
                                       width: 30,
                                       decoration: BoxDecoration(
                                           color:Colors.transparent,
                                           borderRadius: BorderRadius.circular(55.0),
                                           border:Border.all(color: Colors.grey,width: 2)
                                       ),


                                       child: AnimatedContainer(
                                duration:const Duration(milliseconds: 200),
                                curve: Curves.fastLinearToSlowEaseIn,
                                decoration: BoxDecoration(
                               color:_isSelected1? Colors.green:Colors.transparent,
                               borderRadius: BorderRadius.circular(55.0),
                               border: _isSelected1?null:Border.all(color: Colors.grey,width: 0)
                                 ),
                                    height: 2,
                                    width: 2,
                                  ),
                                     ),

                               ),
                           const SizedBox(height: 50,width: 20,),
                           const Text('Hector')

                        ],
                     ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState((){
                            _isSelected2=!_isSelected2;
                            _isSelected1=false;
                            _isSelected3=false;
                            _isSelected4=false;
                            land_type='decimal';
                          });
                        },
                        child:  Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color:Colors.transparent,
                              borderRadius: BorderRadius.circular(55.0),
                              border:Border.all(color: Colors.grey,width: 2)
                          ),

                          child: AnimatedContainer(
                            duration:const Duration(milliseconds: 200),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                                color:_isSelected2? Colors.green:Colors.transparent,
                                borderRadius: BorderRadius.circular(55.0),
                                border: _isSelected2?null:Border.all(color: Colors.grey,width: 0)
                            ),
                            height: 2,
                            width: 2,
                          ),
                        ),

                      ),
                     const SizedBox(height: 50,width: 20,),
                     const Text('Decimal')

                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(

                        onTap: (){
                          setState((){

                            _isSelected3=!_isSelected3;
                            _isSelected2=false;
                            _isSelected1=false;
                            _isSelected4=false;
                            land_type='katha';
                          });
                        },
                        child:  Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color:Colors.transparent,
                              borderRadius: BorderRadius.circular(55.0),
                              border:Border.all(color: Colors.grey,width: 2)
                          ),

                          child: AnimatedContainer(
                            duration:const Duration(milliseconds: 200),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                                color:_isSelected3? Colors.green:Colors.transparent,
                                borderRadius: BorderRadius.circular(55.0),
                                border: _isSelected3?null:Border.all(color: Colors.grey,width: 0)
                            ),
                            height: 2,
                            width: 2,
                          ),
                        ),

                      ),
                      const SizedBox(height: 50,width: 20,),
                      const Text('Katha')

                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(

                        onTap: (){
                          setState((){

                            _isSelected4=!_isSelected4;
                            _isSelected2=false;
                            _isSelected3=false;
                            _isSelected1=false;
                            land_type='bigha';
                          });
                        },
                        child:  Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color:Colors.transparent,
                              borderRadius: BorderRadius.circular(55.0),
                              border:Border.all(color: Colors.grey,width: 2)
                          ),
                          child: AnimatedContainer(
                            duration:const Duration(milliseconds: 200),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                                color:_isSelected4? Colors.green:Colors.transparent,
                                borderRadius: BorderRadius.circular(55.0),
                                border: _isSelected4?null:Border.all(color: Colors.grey,width: 0)
                            ),
                            height: 2,
                            width: 2,
                          ),
                        ),

                      ),
                     const SizedBox(height: 50,width: 20,),
                      const Text('Bigha')

                    ],
                  ),


                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Container(
              height: 40,
              width: 200,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: MaterialButton(

                child:const Text('Save',style: TextStyle(color: Colors.white),),
                onPressed: ()async{
                  await sendInfo();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
