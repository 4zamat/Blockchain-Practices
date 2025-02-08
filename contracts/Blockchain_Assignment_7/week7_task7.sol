pragma solidity ^0.8.0;

library ArrayStatsLib {
    function average(uint256[] memory data) internal pure returns (uint256) {
        require(data.length > 0, "Array must not be empty");
        uint256 sum = 0;
        for (uint256 i = 0; i < data.length; i++) {
            sum += data[i];
        }
        return sum / data.length;
    }

    function median(uint256[] memory data) internal pure returns (uint256) {
        require(data.length > 0, "Array must not be empty");
        uint256[] memory sorted = sort(data);
        uint256 mid = sorted.length / 2;
        if (sorted.length % 2 == 0) {
            return (sorted[mid - 1] + sorted[mid]) / 2;
        } else {
            return sorted[mid];
        }
    }

    function mode(uint256[] memory data) internal pure returns (uint256[] memory) {
        require(data.length > 0, "Array must not be empty");
        uint256[] memory uniqueValues = new uint256[](data.length);
        uint256[] memory counts = new uint256[](data.length);
        uint256 uniqueCount = 0;
        uint256 maxCount = 0;

        for (uint256 i = 0; i < data.length; i++) {
            bool found = false;
            for (uint256 j = 0; j < uniqueCount; j++) {
                if (uniqueValues[j] == data[i]) {
                    counts[j]++;
                    found = true;
                    if (counts[j] > maxCount) {
                        maxCount = counts[j];
                    }
                    break;
                }
            }
            if (!found) {
                uniqueValues[uniqueCount] = data[i];
                counts[uniqueCount] = 1;
                uniqueCount++;
                if (counts[uniqueCount - 1] > maxCount) {
                    maxCount = counts[uniqueCount - 1];
                }
            }
        }

        uint256 modeCount = 0;
        for (uint256 i = 0; i < uniqueCount; i++) {
            if (counts[i] == maxCount) {
                modeCount++;
            }
        }

        uint256[] memory modes = new uint256[](modeCount);
        uint256 index = 0;
        for (uint256 i = 0; i < uniqueCount; i++) {
            if (counts[i] == maxCount) {
                modes[index] = uniqueValues[i];
                index++;
            }
        }

        return modes;
    }

    function sort(uint256[] memory data) private pure returns (uint256[] memory) {
        uint256 n = data.length;
        for (uint256 i = 0; i < n; i++) {
            for (uint256 j = i + 1; j < n; j++) {
                if (data[i] > data[j]) {
                    (data[i], data[j]) = (data[j], data[i]);
                }
            }
        }
        return data;
    }
}

contract ArrayStatsUser {
    using ArrayStatsLib for uint256[];

    function testArrayStats() external pure returns (uint256, uint256, uint256[] memory) {
        uint256[] memory numbers = new uint256[](5);
        numbers[0] = 4;
        numbers[1] = 2;
        numbers[2] = 2;
        numbers[3] = 8;
        numbers[4] = 6;

        uint256 avg = numbers.average();
        uint256 med = numbers.median();
        uint256[] memory modes = numbers.mode();

        return (avg, med, modes);
    }
}
