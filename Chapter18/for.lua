a = {"one", "two", "three"}

print(">>>>>>>>>>>>>  ipairs list <<<<<<<<<<<")
for i, v in ipairs(a) do
    print(string.format("a[%d] is: %s", i, v))
end

print(">>>>>>>>>>>>>  pairs list <<<<<<<<<<<")
for i, v in pairs(a) do
    print(string.format("a[%d] is: %s", i, v))
end

print(">>>>>>>>>>>>>  pairs list only value <<<<<<<<<<<")
local i = 0
for v in pairs(a) do
    i = i + 1
    print(string.format("a[%d] is: %s", i, v))
end

print(">>>>>>>>>>>>>  next list <<<<<<<<<<<")
for i, v in next, a do
    print(string.format("a[%d] is: %s", i, v))
end

-- 获取第一个下标
c = next(a, nil)
print("next(a, nil) key is:", c)
-- 获取下一个下标
c = next(a, c)
print("next(a, 1) key is:", c)




b = {x=1, y=2, z=-1}

print(">>>>>>>>>>>>>  ipairs map error <<<<<<<<<<<")
-- for i, v in ipairs(b) do
--     print(string.format("b[%d] is: %s", i, v))
-- end

print(">>>>>>>>>>>>>  pairs map <<<<<<<<<<<")
for k, v in pairs(b) do
    print(string.format("b[%s] is: %s", k, v))
end

print(">>>>>>>>>>>>>  next map <<<<<<<<<<<")
for k, v in next, b do
    print(string.format("b[%s] is: %s", k, v))
end

print(">>>>>>>>>>>>> show next key <<<<<<<<<<<")
k = nil
repeat
    -- 获取下一个下标
    next_k = next(b, k)
    print(string.format("next(b, %s) key is:%s", k, next_k))
    k = next_k
until k == nill