// Two Sum (#1)

function twoSum(nums, target) {
    let res = [];

    for (let i = 0; i < nums.length; i++) {
        for (let j = i+1; j < nums.length; j++) {
            if(nums[i] + nums[j] === target) {
                res.push(i, j);
            }
        }
    }
    return res;
}
