import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
  });
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD');

    debugPrint(response.toString());

    final data = response.data['RAW'] as Map<String, dynamic>;
    final dataList = data.entries.map((e) {
      return CryptoCoin(
          name: e.key,
          priceInUSD: e.value['USD']['PRICE'],
          imageURL: "https://cryptocompare.com/${e.value['USD']['IMAGEURL']}");
    }).toList();
    return dataList;
  }
}

// https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD