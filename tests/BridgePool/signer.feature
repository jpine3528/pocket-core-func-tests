Feature: Signer
    The BridgePool should have signer registered to verify signature at the time of withdrawal.
    Signer can be added or removed by module admin.

    Scenario: Add signer
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 which is module admin exists
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 add signer
        When typing "pocket bridgepool add-signer <fromAddr> <signer> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the signers
        When typing "pocket query signers"
        Then the signer should be added
            |  |
            {
            "Signers": [
            "169869f67cd3f78a722fb4795b69949fb4bc9084"
            ]
            }
            |  |

    Scenario: Remove signer
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 which is module admin exists
        And the signer 169869f67cd3f78a722fb4795b69949fb4bc9084 added on the module
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 remove signer
        When typing "pocket bridgepool remove-signer <fromAddr> <signer> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the signers
        When typing "pocket query signers"
        Then the signer should be removed
            |  |
            {
            "Signers": []
            }
            |  |