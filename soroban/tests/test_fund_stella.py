import pytest
from unittest.mock import patch, MagicMock
from src.fund_stella_processor import FundStellaProcessor


@pytest.fixture
def processor():
    return FundStellaProcessor(config_path="config/config.yaml")


def test_onramp_fiat_to_crypto(processor):
    with patch("helpers.transak_api.get_transak_crypto_amount") as mock_transak:
        mock_transak.return_value = 10.5  # Simulated USDC amount
        crypto_amount = processor.onramp_fiat_to_crypto(
            fiat_amount=100, fiat_currency="USD", crypto_currency="USDC"
        )
        assert crypto_amount == 10.5
        mock_transak.assert_called_once_with(
            api_key=processor.transak_api_key,
            fiat_amount=100,
            fiat_currency="USD",
            crypto_currency="USDC",
        )


def test_send_usdc_success(processor):
    with patch("stellar_sdk.Server.submit_transaction") as mock_submit:
        # Mock response from the Stellar network
        mock_submit.return_value = {"hash": "fake_transaction_hash"}
        sender_private_key = ""
        receiver_address = ""
        crypto_amount = 10.5

        transaction_hash = processor.send_usdc(
            sender_private_key=sender_private_key,
            receiver_address=receiver_address,
            crypto_amount=crypto_amount,
        )
        assert transaction_hash == "fake_transaction_hash"


def test_process_donation(processor):
    with patch.object(processor, "onramp_fiat_to_crypto", return_value=10.5) as mock_onramp:
        with patch.object(processor, "send_usdc", return_value="fake_transaction_hash") as mock_send:
            result = processor.process_donation(
                sender_private_key="",
                receiver_address="",
                fiat_amount=100,
                fiat_currency="USD",
            )
            assert result == {
                "fiat_amount": 100,
                "fiat_currency": "USD",
                "crypto_amount": 10.5,
                "crypto_currency": "USDC",
                "transaction_hash": "fake_transaction_hash",
            }
            mock_onramp.assert_called_once()
            mock_send.assert_called_once()

