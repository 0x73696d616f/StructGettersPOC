# Returning a struct costs less gas than its items individually [POC]

## Usage

Clone the repository.

Install foundry if not already installed https://book.getfoundry.sh/.

Run `forge test -vv`.

## Results

Calling the getters individually or the whole struct produces the same storage accesses, but the gas cost is about 1000 gas less for the latter.