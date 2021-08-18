--八皇后问题


N = 8

--arr 皇后数组 记录每一行皇后的列数
--n   第i个皇后
--c   第col列
function isplaceok(arr, n, col)
    for i=1, n-1 do                     -- 遍历之前的每一个皇后
        if arr[i] == col or             -- 与某个皇后在同一列
           arr[i] == col + n - i or     -- 与某个皇后在同一斜线 下
           arr[i] == col - n + i then   -- 与某个皇后在同一斜线 上
            return false
        end
    end
    return true
end


-- 打印
--arr 皇后数组 记录每一行皇后的列数
function printqueen(arr)
    io.write(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
    for i=1, N do
        for j=1, N do
            if arr[i] == j then
                io.write("X ")
            else
                io.write("- ")
            end
        end
        io.write(string.format("  queue[%d] is %d\n", i, arr[i]))
    end
    io.write("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n")
end 


-- 把从n 到 N的皇后放到棋盘上
--arr 皇后数组 记录每一行皇后的列数
--n   第i个皇后
function addqueen(arr, n)
    for col=1, N do
        if isplaceok(arr, n, col) then  -- 判断是否符合要求
            arr[n] = col                -- 记录位置
            -- print(string.format("queue[%d] is %d", n, col))
            if n < N then               -- 继续搜索
                if addqueen(arr, n+1) then 
                    return true         -- 若深层迭代找到结果 返回
                end
            else
                printqueen(arr)
                return true             -- 找到解 返回
            end
        end
    end
    return false                        -- 未找到解 返回
end

for i=1, N do
    addqueen({i}, 2)
end
    
