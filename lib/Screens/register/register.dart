import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:passwordfield/passwordfield.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body:GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            //SingleChildScrollView(
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 50,),
                              Text("Complete your Profile",style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold,)),
                              Text("Complete your registration process by filling the details below",style: TextStyle(color: Colors.grey, fontSize: 15,),),
                              //]
                              // )

                              // child:Column(
                              //   children: <Widget>[
                                //SizedBox(height: 20,),
                              Container(
                                child: Stack(children: [
                                  CircleAvatar(
                                    radius: 60.0,
                                    backgroundImage:_imageFile == null ?   NetworkImage(
                                        'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg')
                                        :FileImage(File(_imageFile.path)),

                                  ),
                                  Positioned(
                                    bottom: 20.0,
                                    right: 20.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: ((builder) => bottomSheet()),
                                        );
                                      },
                                      child: Icon(
                                          Icons.camera_alt, color: Colors.grey,
                                          size: 28.0
                                      ),
                                    ),
                                  ),

                                ],
                                ),
                              ),
                              //SizedBox(height: 20,),
                              Text("Basic details"),
                              SizedBox(height: 20.0,),
                              TextField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.tealAccent
                                      )
                                  ),
                                  hintText: "Input Text",
                                  labelText: "First Name",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  //  errorText: snapshot.error),
                                ),
                              ),
                              // SizedBox(height: 20.0,),
                              TextField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent )),
                                  hintText: "Input Text",
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  //  errorText: snapshot.error),
                                ),
                              ),

                              TextField(
                                //style: TextStyle(fontSize: 24   ),
                                //controller: _phoneNumberController,
                                //focusNode: _mobileFocus,
                                maxLength: 10,
                                keyboardType: TextInputType.phone,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent )),
                                    prefixText: "+91 ",
                                    labelText: 'Phone number'),

                              ),
                              // SizedBox(height: 20.0,),
                              TextField(

                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.tealAccent
                                      )
                                  ),
                                  hintText: "Input Text",
                                  labelText: "Work Email",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  //  errorText: snapshot.error),
                                ),
                              ),
                              //SizedBox(height: 20,),
                              FlatButton.icon(
                                  icon:Icon(Icons.lock),
                                  label:Text("Password details",style: TextStyle(color: Colors.black),) ),
                              // SizedBox(height: 20,),
                              TextField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(

                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.tealAccent
                                      )
                                  ),
                                  hintText: "Input Text",
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  //suffixIcon: Icon(Icons.visibility,color: Colors.grey,),

                                  // errorText: snapshot.error),
                                ),
                              ),
                              //SizedBox(height: 20,),
                              TextField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(

                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.tealAccent
                                      )
                                  ),
                                  hintText: "Input Text",
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  //suffixIcon: Icon(Icons.visibility,color: Colors.grey,),

                                  // errorText: snapshot.error),
                                ),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:<Widget>[
                                    ButtonTheme(
                                      // minWidth: 400,
                                      //  height: 40,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child: RaisedButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("CANCEL"),
                                      ),

                                    ),
                                    ButtonTheme(
                                      // minWidth: 400,
                                      //  height: 40,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      child: RaisedButton(
                                        color: Colors.tealAccent,
                                        onPressed: () {},
                                        child: Text("SUBMIT&PROCEED"),
                                      ),

                                    ),
                                  ])
                            ]
                        )

                    ))  )
        )
    );
  }
  Widget bottomSheet(){
    return Container(
        height:100.0,
        width:MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal:20,vertical: 20,
        ),
        child:Column(
          children:<Widget>[
            Text("Choose Profile Photo",style:TextStyle(fontSize: 20),),
            SizedBox(
              height:20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                // ButtonTheme(
                //child:
                FlatButton.icon(onPressed: (){
                  takePhoto(ImageSource.camera);
                },
                  icon:Icon(Icons.camera),
                  label:Text("Camera"), ),
                FlatButton.icon(onPressed: (){
                  takePhoto(ImageSource.gallery);
                },
                  icon:Icon(Icons.image),
                  label:Text("Gallery"), ),

              ],
            ),
          ],
        )
    );
  }
  void takePhoto(ImageSource source) async{
    final pickedFile =await _picker.getImage(source: source,);
    setState(() {
      _imageFile = pickedFile;
    });

  }

}
