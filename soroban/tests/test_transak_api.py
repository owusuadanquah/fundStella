import pytest
from unittest.mock import patch
from helpers.transak_api import get_transak_crypto_amount


@patch("requests.get")
def test_get_transak_crypto_amount_success(mock_get):
    # Simulated API response
    mock_get.return_value.status_code = 200
    mock_get.return_value.json.return_value = {
        "data": {"cryptoAmount": "10.5"}
    }

    api_key = "test_api_key"
    fiat_amount = 100
    fiat_currency = "USD"
    crypto_currency = "USDC"

    crypto_amount = get_transak_crypto_amount(
        api_key=api_key,
        fiat_amount=fiat_amount,
        fiat_currency=fiat_currency,
        crypto_currency=crypto_currency,
    )
    assert crypto_amount == 10.5
    mock_get.assert_called_once_with(
        "https://api.transak.com/api/v2/cryptoEstimate",
        params={
            "apiKey": api_key,
            "fiatCurrency": fiat_currency,
            "fiatAmount": fiat_amount,
            "cryptoCurrency": crypto_currency,
        },
    )


@patch("requests.get")
def test_get_transak_crypto_amount_error(mock_get):
    # Simulate an error response
    mock_get.return_value.status_code = 400
    mock_get.return_value.json.return_value = {"error": "Invalid request"}

    api_key = "test_api_key"
    fiat_amount = 100
    fiat_currency = "INVALID"
    crypto_currency = "USDC"

    with pytest.raises(Exception, match="400 Client Error"):
        get_transak_crypto_amount(
            api_key=api_key,
            fiat_amount=fiat_amount,
            fiat_currency=fiat_currency,
            crypto_currency=crypto_currency,
        )

