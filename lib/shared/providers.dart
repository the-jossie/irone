import 'package:provider/provider.dart';

import '../models/message.dart';
import '../models/user_model.dart';
import '../models/emergency_services.dart';

import '../services/auth.dart';
import '../models/appointment.dart';
import '../models/article.dart';
import '../models/chat.dart';
import '../models/doctor.dart';

final providers = [
  ChangeNotifierProvider.value(
    value: GoogleSignInProvider(),
  ),
  ChangeNotifierProvider.value(
    value: EmergencyServices(),
  ),
  ChangeNotifierProvider.value(
    value: Doctors(),
  ),
  ChangeNotifierProvider.value(
    value: Articles(),
  ),
  ChangeNotifierProvider.value(
    value: Messages(),
  ),
  ChangeNotifierProvider.value(
    value: CurrentUser(),
  ),
  ChangeNotifierProvider.value(
    value: Appointments(),
  ),
  ChangeNotifierProvider.value(
    value: Chats(),
  ),
];
