import 'package:marketplace_app/src/resource/repository.dart';
import 'package:marketplace_app/src/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc{

  final _repository = Repository();
  final _UserFetcher = PublishSubject<UserModel>();
  Observable<UserModel> get user => _UserFetcher.stream;

  SaveUser( user) async {
    _repository.SaveUser(user);
  }

  fetchUser() async {
    UserModel user = await _repository.fetchUser();
    _UserFetcher.sink.add(user);
  }
}
final loginBloc=LoginBloc();