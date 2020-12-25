import 'package:coderbot/controller/watsonController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatsonAi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<WatsonController>(
      init: WatsonController(),
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('Coderbot'),
          ),
          body: GestureDetector(
              onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
              child: SafeArea(
                  child: Stack(
                      children: [
                        GetBuilder<WatsonController>(
                          id: 'conversation',
                          builder: (_) => Container(
                              width: size.width,
                              height: size.height,
                              margin: EdgeInsets.only(bottom: 65.0),
                              child: _.conversation.length == 0 ? Center(
                                child: Text('escribe algo we'),
                              ) : ListView.builder(
                                itemCount: _.conversation.length,
                                itemBuilder: (BuildContext context, int index) => _.conversationBuilder(index)
                              )
                          )
                        ),
                        Positioned(
                            bottom: 10.0,
                            left: 0.0,
                            right: 0.0,
                            child: TextFormField(
                              controller: _.input,
                                onChanged: (txt)=> _.message = txt,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                                    hintText: 'Escribe un mensaje',
                                    suffixIcon: Icon(Icons.send)
                                ),
                                onEditingComplete: ()=> _.receivedMessage(_.input.text),
                                // onTap: () => _.receivedMessage(_.message),
                                // onSubmitted: (txt) => _.receivedMessage(_.message)
                            )
                        )
                      ]
                  )
              )
          )
      ),
    );
  }
}
