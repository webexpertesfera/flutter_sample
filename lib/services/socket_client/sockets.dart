// import 'dart:convert';
//
// import 'package:flutter_sample/constants/export.dart';
//
//
// import 'package:socket_io_client/socket_io_client.dart' as io;
//
// class SocketClient {
//   static io.Socket? socket;
//
//   static initSocket({userId,gameId}) {
//     socket = io.io(socketUrl, <String, dynamic>{
//       'autoConnect': false,
//       'transports': ['websocket'],
//     });
//
//     socket?.connect();
//     socket?.onConnect((_) {
//       debugPrint('connected To Socket ${socket?.io.uri}');
//       connectToSever(userId);
//       connectToMatchEmit(userId: userId,gameId: gameId);
//       getAllActivityEmit(userId: userId,gameId: gameId);
//
//     });
//     socket?.onDisconnect((_) {
//   debugPrint('Disconnected');
//     } );
//     socket?.onConnectError((err) => debugPrint(err.toString()));
//     socket?.onError((err) => debugPrint(err.toString()));
//   }
//
//   static disconnectSocket(){
//     socket?.disconnect();
//     socket?.dispose();
//   }
//
//   static connectToSever(userId){
//     var dataBody=RequestModel.socketConnectToServerRequestModel(userId: userId);
//     socket?.emit(SocketConsts.emitConnectToServer, dataBody);
//   }
//
//   static listenConnectListener(){
//     socket?.on(SocketConsts.listenerConnectListener, (data) {
//       debugPrint("Fetched Data $data");
//     });
//   }
//   static connectToMatchEmit({userId, gameId}){
//     var dataBody=RequestModel.socketConnectToMatchRequestModel(userId: userId,gameId: gameId);
//     socket?.emit(SocketConsts.emitConnectToMatch, dataBody);
//   }
//   static getAllActivityEmit({userId, gameId}){
//     var dataBody=RequestModel.socketConnectToMatchRequestModel(userId: userId,gameId: gameId);
//     socket?.emit(SocketConsts.emitGetAllActivity, dataBody);
//   }
//
//   static matchActivityEmit(data){
//     socket?.emit(SocketConsts.emitMatchActivity, data);
//   }
//
//   static substitutionMatchActivityEmit(data){
//     socket?.emit(SocketConsts.emitSubstitutionMatchActivity, data);
//   }
//   static deleteMatchActivityEmit(data){
//     socket?.emit(SocketConsts.emitDeleteActivity, data);
//   }
//
//
//
//   static emitData({data,@required String? emitter}){
//     socket?.emit(emitter!, data);
//   }
//
//   static dynamic listenAllActivity(){
//     socket?.on(SocketConsts.listenerAllActivity, (data) {
//       debugPrint("Fetched Data $data");
//       return data;
//     });
//   }
//
//
//
// }
