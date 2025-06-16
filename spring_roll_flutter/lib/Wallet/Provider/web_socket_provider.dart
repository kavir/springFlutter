// import 'package:web_socket_channel/web_socket_channel.dart';

// class WebSocketService {
//   final WebSocketChannel channel;

//   WebSocketService(String userId)
//       : channel = WebSocketChannel.connect(
//           Uri.parse(
//               'ws://192.168.1.81:9090/ws/balance/$userId'), // Update this with your server URL
//         );

//   // Listen for messages
//   Stream<dynamic> get balanceStream => channel.stream;

//   // Send a message to the backend if needed
//   void sendMessage(String message) {
//     channel.sink.add(message);
//   }

//   // Close the WebSocket connection
//   void close() {
//     channel.sink.close();
//   }
// }

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class WebSocketService {
//   final WebSocketChannel _channel;

//   WebSocketService(String url) : _channel = IOWebSocketChannel.connect(url);

//   // Method to send messages
//   void sendMessage(String message) {
//     _channel.sink.add(message);
//   }

//   // Stream of incoming messages
//   Stream<String> get messageStream =>
//       _channel.stream.map((event) => event.toString());

//   // Close the WebSocket connection
//   void close() {
//     _channel.sink.close();
//   }
// }

// final webSocketProvider = Provider<WebSocketService>((ref) {
//   // Replace with your WebSocket URL
//   final webSocketService =
//       WebSocketService('ws://192.168.1.81:9090/ws/transactions');
//   return webSocketService;
// });

// final webSocketStreamProvider = StreamProvider<String>((ref) {
//   final webSocketService = ref.watch(webSocketProvider);
//   return webSocketService.messageStream;
// });
