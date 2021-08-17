function fact(n)        -- 阶乘函数
    if n == 0 then      
        return 1        -- 0!=1
    else
        return fact(n - 1) * n  -- n!= n*(n-1)!
    end
end

--[[
    长注释
]]


---[[
    print("无效长注释 ---[[")
--]]
print("fact 5:", fact(5))