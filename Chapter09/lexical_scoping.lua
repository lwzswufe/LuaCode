function new_Counter()
    local count = 0         -- 局部变量 count 可被下一行定义的匿名函数访问
    return function()       -- 返回定义的匿名函数
        count = count + 1   -- 访问局部变量 count
        return count
    end
end

C1 = new_Counter()
for i =1, 3 do
    print(string.format("Count1 call %dst time = %d", i, C1()))
end

C2= new_Counter()           -- C1 C2访问不同的闭包 不同内存地址 局部变量
for i =1, 3 do
    print(string.format("Count2 call %dst time = %d", i, C2()))
end

function disk(cx, cy, r)    -- 创建一个圆心为cx cy半径为r的圆
    return function(x, y)   -- 创建一个判断点x y是否在圆心为cx cy半径为r的圆内部的函数
        return (x - cx)^2 + (y-cy)^2 <= r^2
    end
end

function difference(r1, r2) -- 差集判断函数生成器 判断点x y 是否在圆r1内 且不在 圆r2内
    return function (x, y)
        return r1(x, y) and not r2(x, y)
    end
end

function translate(r, dx, dy)   -- 按照指定增量dx dy平移图形r
    return function (x, y)
        return r(x - dx, y - dy)
    end 
end

function plot(r, M, N)      -- 在M X N的画布上绘制图形r
    local file = io.open("a.pbm", "w")
    file:write(string.format("P1\n%d %d\n", M, N))  -- 文件头
    for i = 1, N do         -- 每一行
        local y = (N - i*2)/N
        for j = 1, M do     -- 每一列
            local x = (j*2 - M)/M
            file:write(r(x, y) and "1" or "0") -- 在图形r内部返回1 外部返回0
        end
        file:write("\n")
    end 
end 

print(true and "1" or "0")
print(false and "1" or "0")
print(true and "1")
print(false and "1")

c1 = disk(0, 0, 1)
plot(difference(c1, translate(c1, 0.3, 0)), 500, 500)