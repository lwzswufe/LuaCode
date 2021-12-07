
-- 加载字符串字面量
i = 64
local i = 32
print("global i=64 local i=32")
f = load("i = i + 1;print(i);print('load function can use global variable')")
print("type f:", type(f))
f()

-- 加载字符串变量  --定义局部变量
-- 独立代码段视作匿名函数
str = [[
    local s = 0
    for _, v in ipairs{...} do
        if v then
            s = s + v
        end
        print(string.format("param[%d] is %d", _, v))
    end
    return s
]]
print(str)
f = load(str)
print("type f:", type(f))
sum = f(1, 2)
print("sum is ", sum)