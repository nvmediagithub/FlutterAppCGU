import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/repositories/crypto_coins/crypto_coins.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        emit(CryptoListLoading());
        final cryptoCoinList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: cryptoCoinList));
      } on Exception catch (e) {
        emit(CryptoListFailure(exception: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
