import 'package:bitcoin_ticker/network-helper.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'BF7A1511-7588-4EB1-9F28-E795839090F5';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      print('$coinAPIURL/$crypto$selectedCurrency?apikey=$apiKey');
      NetworkHelper networkHelper = NetworkHelper(
          url: '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey');
      try {
        var decodedData = await networkHelper.get();
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } catch (e) {
        print(e);
      }
    }
    return cryptoPrices;
  }
}
