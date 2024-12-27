# fundStella
Fund Stella is a decentralized platform built on Stellar's **Soroban smart contracts** to facilitate donations for young women's education in developing countries. This solution leverages USDC and fiat-to-crypto on-ramps to ensure seamless cross-border transactions. Dedicated to enabling the fundraising of higher education.

![Fund Stella](https://github.com/owusuadanquah/fundStella/blob/main/docs/images/fund-stella-thumbnail.png)

## Features

- **Donation Smart Contract**: Allows secure and transparent transfers using Soroban smart contracts.
- **Dynamic Configuration**: Supports dynamic setup of USDC issuer and other parameters.
- **Fiat-to-Crypto On-Ramp**: Integrated with fiat-to-crypto services like Transak.
- **End-to-End Rust**: Built using Rust for Soroban contracts and client-side integration.

## Generative AI

Fund Stella leverages Generative AI to provide tailored mentorship and guidance to young women.

![Fund Stella](https://github.com/owusuadanquah/fundStella/blob/main/docs/images/fund-stella-features.png)

## Installation and Running Instructions

Follow these steps to set up and run the server for the **FundStella LLM endpoint**.

### 1. **Install Ollama on Linux**
First, install Ollama by running the following command:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

Download & Run the LLM Model
```bash
ollama pull tinyllama
ollama run tinyllama
```
Mentor model will be served at the following endpoint url:
```
http://127.0.0.1:3000/ask-mentor
```

Pass a query to the model:
```
{
  "message": "What is the best way to help for geometry homework questions?"
}
```

Example Response:
```
{
  "response": "Depending on the resources you have available to you, you can consider the following options: ..."
}
```

