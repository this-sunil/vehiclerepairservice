// import 'package:flutter/material.dart';
// import 'package:tha_player/tha_player.dart';
// import 'package:vehicle_repair_service/Routes/route.dart';
//
// class PlayerScreen extends StatefulWidget {
//   const PlayerScreen({super.key});
//
//   @override
//   State<PlayerScreen> createState() => _PlayerScreenState();
// }
//
// class _PlayerScreenState extends State<PlayerScreen>
//     with WidgetsBindingObserver {
//
//   late final ThaNativePlayerController ctrl;
//
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addObserver(this);
//
//     ctrl = ThaNativePlayerController.single(
//       ThaMediaSource(
//         'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//       ),
//       autoPlay: false,
//       loop: false,
//       initialBoxFit: BoxFit.cover,
//       playbackOptions: const ThaPlaybackOptions(
//         maxRetryCount: 5,
//         initialRetryDelay: Duration(milliseconds: 800),
//       ),
//       initialPreferences: const ThaPlayerPreferences(
//         playbackSpeed: 1.0,
//         dataSaver: true,
//       ),
//     );
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {
//       ctrl.pause();
//     } else if (state == AppLifecycleState.resumed) {
//       // optional: resume only if previously playing
//       ctrl.play();
//     }
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     ctrl.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: AspectRatio(
//           aspectRatio: 16 / 9,
//           child: ThaModernPlayer(
//             controller: ctrl,
//             doubleTapSeek: const Duration(seconds: 10),
//             longPressSeek: const Duration(seconds: 3),
//             autoHideAfter: const Duration(seconds: 3),
//             onErrorDetails: (err) {
//               if (err != null) {
//                 debugPrint('Playback error: ${err.code} • ${err.message}');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }