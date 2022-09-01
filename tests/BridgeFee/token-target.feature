Feature: Token Target Info
    The BridgeFee has token target info managed by module admin. Token target info describes where to send fees.

    Scenario: Set token target info
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 which is module admin exists
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 set token targets info
        When typing "pocket bridgefee set-token-target-infos <fromAddr> <token> <targets> <weights> <targetTypes> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query token targets
        When typing "pocket query all-token-target-infos"
        Then the signer should be added
            |  |
            {
            "Infos": [
            {
            "targets": [
            {
            "tType": 2,
            "target": "924364bbf0347842e1e0fa9cd2167dc630fc3c0c",
            "weight": "1"
            },
            {
            "tType": 2,
            "target": "a9cb5f27e7a4b2be3045439f151d3e68108cd65c",
            "weight": "1"
            }
            ],
            "token": "upokt"
            }
            ]
            }
            |  |

    Scenario: Set global token target info
        Given a pocket network with <ChainID>
        And an account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 which is module admin exists
        When the account with address 169869f67cd3f78a722fb4795b69949fb4bc9084 set global token targets info
        When typing "pocket bridgefee set-global-target-infos <fromAddr> <targets> <weights> <targetTypes> <fee> <chainId>"
        Then user should be prompted to enter its passphrase: "Enter Passphrase: "
        When passphrase is provided
        And the details of the transaction should show "success: true"
        When user query token targets
        When typing "pocket query all-token-target-infos"
        Then the signer should be added
            |  |
            {
            "Infos": [
            {
            "targets": [
            {
            "tType": 2,
            "target": "924364bbf0347842e1e0fa9cd2167dc630fc3c0c",
            "weight": "1"
            },
            {
            "tType": 2,
            "target": "a9cb5f27e7a4b2be3045439f151d3e68108cd65c",
            "weight": "1"
            }
            ],
            "token": ""
            }
            ]
            }
            |  |