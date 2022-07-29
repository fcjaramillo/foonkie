import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foonkie_monkey/core/device/email.dart';
import 'package:foonkie_monkey/core/device/pick_image.dart';

final emailProvider = Provider((ref) => Email());
final pickImageProvider = Provider((ref) => PickImage());