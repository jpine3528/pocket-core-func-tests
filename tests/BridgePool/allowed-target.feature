Feature: Allowed Target
    The BridgePool manages allowed targets by module admin. Allowed target describes
    which targets are being supported by the bridge.

    Scenario: Add allowed target
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 which is module admin exists
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 add an allowed target
        When typing "pocket bridgepool allow-target <fromAddr> <token> <targetChainId> <targetToken> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the allowed targets
        When typing "pocket query allowed-targets"
        Then the target should be added
            |  |
            {
            "AllowedTargets": [
            {
            "chainId": "137",
            "targetToken": "0xa5e0829caced8ffdd4de3c43696c57f7d7a678ff",
            "token": "upokt"
            }
            ]
            }
            |  |
    Scenario: Remove allowed target
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 which is module admin exists
        And an allow target exists
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 disallow the target
        When typing "pocket bridgepool disallow-target <fromAddr> <token> <targetChainId> <targetToken> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query the allowed targets
        When typing "pocket query allowed-targets"
        Then the target should be removed
            |  |
            {
            "AllowedTargets": []
            }
            |  |
