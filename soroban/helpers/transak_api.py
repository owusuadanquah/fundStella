import requests

def get_transak_crypto_amount(api_key, fiat_amount, fiat_currency, crypto_currency):
    url = f"https://api.transak.com/api/v2/cryptoEstimate"
    params = {
        "apiKey": api_key,
        "fiatCurrency": fiat_currency,
        "fiatAmount": fiat_amount,
        "cryptoCurrency": crypto_currency,
    }
    response = requests.get(url, params=params)
    response.raise_for_status()
    data = response.json()
    return float(data["data"]["cryptoAmount"])

