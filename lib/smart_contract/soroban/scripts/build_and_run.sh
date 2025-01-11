#!/bin/bash
# Build and run the Rust smart contract
cd rust
cargo build --target=wasm32-unknown-unknown --release
cd ..

