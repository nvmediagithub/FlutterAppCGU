import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:myapp/features/crypto_list/widgets/widgets.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    // _loadCryptoCoins();
    _cryptoListBloc.add(LoadCryptoList());
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('HIHIHI'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _cryptoListBloc.add(LoadCryptoList());
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) =>
                      CryptoCoinTile(coin: state.coinsList[i]),
                );
              } else if (state is CryptoListFailure) {
                return Center(
                    child: Column(
                  children: [
                    Text(
                      state.exception?.toString() ??
                          'Exeption, please try again later',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                    TextButton(
                        onPressed: () => _cryptoListBloc.add(LoadCryptoList()),
                        child: const Text('Try again'))
                  ],
                ));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
      // (_cryptoCoinsList == null)
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.separated(
      //         padding: const EdgeInsets.only(top: 16),
      //         itemCount: _cryptoCoinsList!.length,
      //         separatorBuilder: (context, index) => const Divider(),
      //         itemBuilder: (context, i) {
      //           return CryptoCoinTile(coin: _cryptoCoinsList![i]);
      //         }),
    );
  }

  // Future<void> _loadCryptoCoins() async {
  //   // _cryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
  //   setState(() {});
  // }
}
