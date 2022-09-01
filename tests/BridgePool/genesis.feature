Feature: Genesis
    The BridgePool genesis initialize params, signer, liquidities, fees, targets, used withdraw messages.

    Scenario: Import genesis
        Given a pocket network with <ChainID>
        And genesis with following values
            |  |
            "bridgepool": {
            "params": {
            "owner": "169869f67cd3f78a722fb4795b69949fb4bc9084"
            }
            }
            |  |
        When user queries params
        When typing "pocket query bridgepool-params"
        Then the params should initialized with correct value put on genesis
            |  |
            {
            "owner": "169869f67cd3f78a722fb4795b69949fb4bc9084"
            }
            |  |
        When user queries signers
        When typing "pocket query signers"
        Then the signers should be displaying following values
            |  |
            {
            "Signers": []
            }
            |  |
        When user queries liquidities
        When typing "pocket query liquidities"
        Then the liquidities should be displaying following values
            |  |
            {
            "Liquidities": []
            }
            |  |
        When user queries fee rates
        When typing "pocket query fee-rates"
        Then the fee rates should be displaying following values
            |  |
            {
            "FeeRates": []
            }
            |  |
        When user queries allowed targets
        When typing "pocket query allowed-targets"
        Then the fee rates should be displaying following values
            |  |
            {
            "AllowedTargets": []
            }
            |  |

    Scenario: Export genesis
        Given a pocket network with <ChainID>
        And genesis is initialized with following values
            |  |
            "bridgepool": {
            "params": {
            "owner": "169869f67cd3f78a722fb4795b69949fb4bc9084"
            }
            }
            |  |
        And the node is stopped
        When user export genesis
        When typing "pocket util export-genesis-for-reset <height> <newChainID>"
        Then the the response should include following result
            |  |
            "bridgepool": {
            "allowedTargets": [],
            "fees": [],
            "liquidities": [],
            "params": {
            "owner": "169869f67cd3f78a722fb4795b69949fb4bc9084"
            }
            },
            |  |