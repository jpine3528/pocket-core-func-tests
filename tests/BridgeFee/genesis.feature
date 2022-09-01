Feature: Genesis
    The BridgeFee genesis initialize params, token infos and token target infos.

    Scenario: Import genesis
        Given a pocket network with <ChainID>
        And genesis with following values
            |  |
            "bridgefee": {
            "params": {
            "owner": "169869f67cd3f78a722fb4795b69949fb4bc9084"
            }
            }
            |  |
        When user queries params
        When typing "pocket query bridgefee-params"
        Then the params should initialized with correct value put on genesis
            |  |
            {
            "owner": "169869f67cd3f78a722fb4795b69949fb4bc9084"
            }
            |  |
        When user queries token infos
        When typing "pocket query all-token-infos"
        Then the signers should be displaying following values
            |  |
            {
            "Infos": []
            }
            |  |
        When user queries token target infos
        When typing "pocket query all-token-target-infos"
        Then the liquidities should be displaying following values
            |  |
            {
            "Infos": []
            }
            |  |

    Scenario: Export genesis
        Given a pocket network with <ChainID>
        And genesis is initialized with following values
            |  |
            "bridgefee": {
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
            "bridgefee": {
            "params": {
            "owner": "169869f67cd3f78a722fb4795b69949fb4bc9084"
            },
            "tokenInfos": [],
            "tokenTargets": []
            }
            |  |