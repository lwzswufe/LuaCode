function add(a, b)
    a = a or 0          -- 将nil转换为 0
    b = b or 0          -- 将nil转换为 0
    return a + b
end


function sum_1(...)
    local s = 0
    for _, v in ipairs{...} do
        if v then
            s = s + v
        end
        print(string.format("...[%d] is %d", _, v))
    end
    return s
end


function sum_2(...)
    local arg = table.pack(...)
    local s = 0
    print(string.format("参数个数:arg.n=%d #arg=%d" , arg.n, #arg))
    for i = 1, arg.n do
        if arg[i] then
            s = s + arg[i]
        end
    end
    return s
end


function sum_3(...)
    local argn = select("#", ...)
    local s = 0
    print(string.format("参数个数:argn=%d", argn))
    for i = 1, argn do
        v = select(i, ...)
        if v then
            s = s + v
        end
    end
    return s
end

print("add() 0个参数 等效于 add(nil， nil)")
print(add())

print("add(3) 1个参数 等效于 add(3， nil)")
print(add(3))

print("add(3, 4) 2个参数 等效于 add(3， 4)")
print(add(3, 4))

print("add(3, 4, 5) 2个参数 等效于 add(3， 4)")
print(add(3, 4))

print("sum_1(1) 1个参数")
print(sum_1(1))

print("sum_1(1, 2, 3) 3个参数")
print(sum_1(1, 2, 3))

print("sum_1(1, nil, 3) 3个参数")
print(sum_1(1, nil, 3))


print("sum_2(1) 1个参数")
print(sum_2(1))

print("sum_2(1, 2, 3) 3个参数")
print(sum_2(1, 2, 3))

print("sum_2(1, nil, 3) 3个参数")
print(sum_2(1, nil, 3))


print("sum_3(1) 1个参数")
print(sum_3(1))

print("sum_3(1, 2, 3) 3个参数")
print(sum_3(1, 2, 3))

print("sum_3(1, nil, 3) 3个参数")
tuple = table.pack(1, nil, 3)
print(sum_3(table.unpack(tuple)))