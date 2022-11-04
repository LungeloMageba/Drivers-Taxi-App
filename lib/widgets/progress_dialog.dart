import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget
{
  String? message;
  ProgressDialog({this.message});


  @override
  Widget build(BuildContext context)
  {
    return Dialog(
      backgroundColor:Colors.blue,
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration : BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(width: 6.0,),
              const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),

              const SizedBox(width: 26.0,),

              Text(
                message!,
                style:const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                )
              ),
            ],

          ),
        )
      )
    );
  }
}


