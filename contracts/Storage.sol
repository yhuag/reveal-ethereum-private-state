contract PrivateStorage {
    uint256 private pos0;
    bool private pos1_1;
    uint16 private pos1_2;
    mapping(uint => uint) private pos2;
    
    constructor() {
        pos0 = 5;
        pos1_1 = true;
        pos1_2 = 6;
        pos2[1] = 7;
    }
}

/*
 * Pos0:
 * curl -X POST --data '{"jsonrpc":"2.0", "method": "eth_getStorageAt", "params": ["0xb3b4546a6d8c8cd1081ac94a7e06a24b207c863d", "0x0", "latest"], "id": 1}' localhost:8545
 * Answer:
 * {"id":1,"jsonrpc":"2.0","result":"0x05"}
 *
 * Pos1_1 & Pos1_2:
 * curl -X POST --data '{"jsonrpc":"2.0", "method": "eth_getStorageAt", "params": ["0xb3b4546a6d8c8cd1081ac94a7e06a24b207c863d", "0x1", "latest"], "id": 1}' localhost:8545
 * {"id":1,"jsonrpc":"2.0","result":"0x6401"}
 *
 * Pos2:
 * var key = "0000000000000000000000000000000000000000000000000000000000000001" + "0000000000000000000000000000000000000000000000000000000000000002"
 * // key || position (e.g. 2)
 * web3.sha3(key, {"encoding": "hex"})
 * // 0xe90b7bceb6e7df5418fb78d8ee546e97c83a08bbccc01a0644d599ccd2a7c2e0
 * curl -X POST --data '{"jsonrpc":"2.0", "method": "eth_getStorageAt", "params": ["0xb3b4546a6d8c8cd1081ac94a7e06a24b207c863d", "0xe90b7bceb6e7df5418fb78d8ee546e97c83a08bbccc01a0644d599ccd2a7c2e0", "latest"], "id": 1}' localhost:8545
 * Answer:
 * {"id":1,"jsonrpc":"2.0","result":"0xc8"}
*/

