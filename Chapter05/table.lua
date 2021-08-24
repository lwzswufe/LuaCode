a = {}
print("空表")
print(a)
print("求长度")
print(#a)

print("列表初始化")
a = {"a", b="b", c="d"}

print(a[1], a["b"], a.c, a[-1])

a = {
    color="blue",
    {x=0, y=0},
    {x=1, y=1},
}
print(a[1].x, a[2].y)

i = 20
s = "s"
a = {[i+0] = s, [i+1] = s..s, [i+2] = s..s..s}
print("非序列 求长度符号无效")
print(#a)
print("for循环遍历")
for j = 1, 3 do
    print(string.format("a[%d]=%s", i+j-1, a[i+j-1]))
end
print("pairs迭代器循环遍历")
for k, v in pairs(a) do
    print(string.format("a[%d]=%s", k, v))
end

print("序列变量插入前")
a = {"a", "b", "c"}
for k, v in pairs(a) do
    print(string.format("a[%d]=%s", k, v))
end

print("序列变量在第2个位置插入")
table.insert(a, 2, "insert")
for k, v in pairs(a) do
    print(string.format("a[%d]=%s", k, v))
end

print("序列变量在末尾插入")
table.insert(a, "back")
for k, v in pairs(a) do
    print(string.format("a[%d]=%s", k, v))
end

b = table.remove(a)
print("序列变量在末尾删除 元素:", b)
for k, v in pairs(a) do
    print(string.format("a[%d]=%s", k, v))
end

b = table.remove(a, 2)
print("序列变量在位置2删除 元素:", b)
for k, v in pairs(a) do
    print(string.format("a[%d]=%s", k, v))
end

table.move(a, 1, #a, 2)
print("将列表a[1:#a]的元素移动到 a[2:#a+1]")
for k, v in pairs(a) do
    print(string.format("a[%d]=%s", k, v))
end

b = {}
print("将列表a[1:#a]的元素移动到 b[1:#a]")
table.move(a, 1, #a, 1, b)
for k, v in pairs(a) do
    print(string.format("a[%d]=%s", k, v))
end
for k, v in pairs(b) do
    print(string.format("b[%d]=%s", k, v))
end
