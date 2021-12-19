t = {}
print("新表默认没有元表")
print("getmetatable(t) 显示表t的元表:", getmetatable(t))

print("所有字符串使用同一个元表")
print("'hi'   的元表", getmetatable("hi"))
print("'xuxu' 的元表", getmetatable("xuxu"))


-- 定义元表  集合
local Set = {}
-- 定义元表
local mt = {}


--  根据列表l创建新集合
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

-- 求并集
function Set.union(a, b)
    res = Set.new{}
    -- 添加a的元素
    for v in pairs(a) do
        res[v] = true
    end
    -- 添加b的元素
    for v in pairs(b) do
        res[v] = true
    end
    return res
end


-- 求交集
function Set.intersection(a, b)
    res = Set.new{}
    -- 添加a的元素
    for v in pairs(a) do
        res[v] = b[v]
    end
    return res
end


-- 求交集
function Set.tostring(set)
    if set == nil then
        return "nil"
    end
    local l = {}
    -- 添加a的元素
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end
    return "{" .. table.concat(l, ", ") .. "}"
end


-- 定义加法 集合并集
mt.__add = Set.union
-- 定义乘法 集合交集
mt.__mul = Set.intersection

s1 = Set.new({10, 20, 30, 50})
s2 = Set.new({30, 1})

print("set s1 = ", Set.tostring(s1))
print("set s2 = ", Set.tostring(s2))

s3 = s1 + s2

print("set s1 + s2 = ", Set.tostring(s3))

s3 = s1 * s2

print("set s1 * s2 = ", Set.tostring(s3))

-- 定义属性
property = {width=480, height=320}
-- 定义元表
local mt_i = {}
-- 定义初始化方法  绑定元表
function new(o)
    setmetatable(o, mt_i)
    return o
end
-- 表未定义元素访问
mt_i.__index = function(_, key)
    print(string.format("visit metatable.__index[%s]", key))
    return property[key]
end

-- 表未定义元素赋值
mt_i.__newindex = function(_, key, value)
    print(string.format("visit metatable.__newindex[%s]", key))
    property[key] = value
    return property[key]
end

w = new{x=10, y=20}
print(" 遍历表属性  元表属性值不会输出")
for k, v in pairs(w) do
    print(string.format("w[%s] is: %s", k, v))
end
print(" 访问元表属性")
print("w.width: ", tostring(w.width))
print("w.hight: ", tostring(w.height))

print("设置位置属性值 会调用元表的__indexnew方法修改元表的值")
w.weight = 5
print(" 遍历表属性  元表属性值不会输出")
for k, v in pairs(w) do
    print(string.format("w[%s] is: %s", k, v))
end
print(" 遍历元表属性")
for k, v in pairs(mt_i) do
    print(string.format("meta[%s] is: %s", k, v))
end
print(" 遍历元表对应的数据表")
for k, v in pairs(property) do
    print(string.format("property[%s] is: %s", k, v))
end