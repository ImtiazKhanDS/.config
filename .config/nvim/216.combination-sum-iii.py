# @leet start
class Solution:
    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        res = []

        def helper(i: int, temp: List):
            if len(temp) == k and sum(temp) == n:
                res.append(temp.copy())
                return

            for p in range(i, 10):
                temp.append(p)
                if sum(temp) > n:
                    temp.pop()
                    continue
                else:
                    helper(p + 1, temp)
                    temp.pop()

        helper(1, [])
        return res


# @leet end

