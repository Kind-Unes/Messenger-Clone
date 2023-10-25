import 'package:dartz/dartz.dart';
import 'package:messenger_clone_app/src/common/services/classes/auth_classes.dart';

typedef AuthResult<T> = Either<AuthFailure, T>;
typedef AutheDelete<T> = Either<AuthFailure, T>;
