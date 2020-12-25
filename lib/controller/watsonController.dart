import 'package:coderbot/models/responses.dart';
import 'package:coderbot/ui/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibm_watson_assistant/ibm_watson_assistant.dart';

class WatsonController extends GetxController{

  TextEditingController input = TextEditingController();
  List<dynamic> conversation = [{'id':0, 'txt':'Hola, en que te puedo ayudar'}];
  String _sessionId, message;
  IbmWatsonAssistant _bot;

  @override
  void onInit() {
    super.onInit();
    this._getSession();
  }

  void _getSession() async{
    final auth = IbmWatsonAssistantAuth(
      assistantId: 'id',
      url: 'url',
      apikey: 'apiKey',
    );

    this._bot = IbmWatsonAssistant(auth);
    this._sessionId = await _bot.createSession();
  }
  
  void receivedMessage(String txt) async{
    print(txt);
    if(txt.isNotEmpty){
      this.addMessage(txt);
      final botRes = await this._bot.sendInput(txt, sessionId: this._sessionId);
      print(botRes.responseText);
      input.clear();
      if(botRes.isNullOrBlank){
        this.conversation.add({'id':0, 'txt': 'No te entiendo we'});
      } else {
        this.conversation.add({'id':0, 'txt':botRes.responseText});
      }
      update(['conversation']);
    }
  }

  void addMessage(String txt){
    this.conversation.add({'id':1, 'txt':txt});
    update(['conversation']);
  }
  
  conversationBuilder(int index){
    final datos = Responses(index: this.conversation[index]['id'], txt: this.conversation[index]['txt']);
    return Item(datos: datos);
  }

  @override
  void onClose() {
    super.onClose();
    this._bot.deleteSession(this._sessionId);
  }

}
