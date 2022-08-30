Feature: Liquidity
    The BridgePool should have liquidity added to be utilized by users who withdraw
    tokens from other networks by relayers' signatures.

    Scenario: Add liquidity
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 with enough upokt balance
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 add liquidity
        When typing "pocket bridgepool add-liquidity <fromAddr> <token> <amount> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the liquidity put
        When typing "pocket query liquidities"
        Then the liquidity put should be increased
            |  |
            {
            "Liquidities": [
            {
            "address": "169869f67cd3f78a722fb4795b69949fb4bc9084",
            "amount": "11111111",
            "token": "upokt"
            }
            ]
            }
            |  |

    Scenario: Remove liquidity
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 with liquidity added
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 remove liquidity
        When typing "pocket bridgepool remove-liquidity <fromAddr> <token> <amount> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the liquidity put
        When typing "pocket query liquidities"
        Then the liquidity put should be decreased
            |  |
            {
            "Liquidities": [
            {
            "address": "169869f67cd3f78a722fb4795b69949fb4bc9084",
            "amount": "111",
            "token": "upokt"
            }
            ]
            }
            |  |