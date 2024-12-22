use soroban_sdk::{contractimpl, Address, Env};

pub struct PaymentContract;

#[contractimpl]
impl PaymentContract {
    pub fn transfer(env: Env, sender: Address, receiver: Address, amount: i128) {
        // Logic for transferring funds
        let token = soroban_sdk::token::Client::new(&env, &"USDC_ISSUER_ADDRESS");
        token.transfer(&sender, &receiver, &amount);
    }
}

