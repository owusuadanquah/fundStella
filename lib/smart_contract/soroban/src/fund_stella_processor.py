import requests
from stellar_sdk import Server, Keypair, TransactionBuilder, Network
from helpers import get_transak_crypto_amount, load_config

class FundStellaProcessor:
    def __init__(self, config_path="config/config.yaml"):
        self.config = load_config(config_path)
        self.transak_api_key = self.config["transak"]["api_key"]
        self.stellar_network = self.config["stellar"]["network"]
        self.stellar_horizon_url = (
            "https://horizon-testnet.stellar.org" if self.stellar_network == "testnet"
            else "https://horizon.stellar.org"
        )
        self.usdc_asset = self.config["stellar"]["usdc_asset"]

    def onramp_fiat_to_crypto(self, fiat_amount, fiat_currency, crypto_currency="USDC"):
        return get_transak_crypto_amount(
            api_key=self.transak_api_key,
            fiat_amount=fiat_amount,
            fiat_currency=fiat_currency,
            crypto_currency=crypto_currency,
        )

    def send_usdc(self, sender_private_key, receiver_address, crypto_amount):
        server = Server(self.stellar_horizon_url)
        sender_keypair = Keypair.from_secret(sender_private_key)
        sender_public_key = sender_keypair.public_key
        sender_account = server.load_account(sender_public_key)

        usdc_asset = self.usdc_asset
        transaction = (
            TransactionBuilder(
                source_account=sender_account,
                network_passphrase=Network.TESTNET_PASSPHRASE
                if self.stellar_network == "testnet"
                else Network.PUBLIC_NETWORK_PASSPHRASE,
                base_fee=100,
            )
            .add_text_memo("FundStella Donation")
            .append_payment_op(
                destination=receiver_address,
                amount=str(crypto_amount),
                asset_code=usdc_asset["code"],
                asset_issuer=usdc_asset["issuer"],
            )
            .build()
        )
        transaction.sign(sender_keypair)
        response = server.submit_transaction(transaction)
        return response["hash"]

    def process_donation(self, sender_private_key, receiver_address, fiat_amount, fiat_currency):
        crypto_amount = self.onramp_fiat_to_crypto(
            fiat_amount=fiat_amount,
            fiat_currency=fiat_currency,
            crypto_currency=self.usdc_asset["code"],
        )
        transaction_hash = self.send_usdc(
            sender_private_key=sender_private_key,
            receiver_address=receiver_address,
            crypto_amount=crypto_amount,
        )
        return {
            "fiat_amount": fiat_amount,
            "fiat_currency": fiat_currency,
            "crypto_amount": crypto_amount,
            "crypto_currency": self.usdc_asset["code"],
            "transaction_hash": transaction_hash,
        }

