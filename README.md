# Decentralized Lottery Smart Contract with Provably Random Draws

## Overview
This repository contains Solidity code for a decentralized lottery smart contract that ensures provably random draws. The implementation utilizes Solidity, Foundry, Chainlink VRF (Verifiable Random Function), and Chainlink Automation for secure and transparent lottery operations.

## Features

1. **Ticket Entry System:**
   - Users can participate in the lottery by purchasing tickets.
   - Ticket fees contribute to the prize pool for the eventual winner.

2. **Automated Draw:**
   - The lottery automatically selects a winner after a specified period (X) of time.
   - The draw process is executed programmatically for transparency and fairness.

3. **Chainlink VRF for Randomness:**
   - Utilizes Chainlink VRF to ensure verifiable randomness in the selection of the winner.
   - This adds an extra layer of security and trust to the lottery process.

4. **Chainlink Automation for Time-Based Trigger:**
   - Chainlink Automation is employed to trigger the draw based on a predefined time.
   - This enhances the efficiency of the lottery system by automating the draw process.

## How it Works

1. Users purchase lottery tickets by sending the required fees to the smart contract.
2. The lottery smart contract accumulates the ticket fees, forming the prize pool.
3. After the specified time period (X), Chainlink Automation triggers the lottery draw.
4. Chainlink VRF generates a random number to determine the winner.
5. The winner is announced, and the prize pool is transferred to their address.

This implementation ensures a secure, transparent, and decentralized lottery experience. Feel free to explore the code and contribute to its improvement!
