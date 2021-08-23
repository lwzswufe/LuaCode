print("字符串连接")
a = "hello"
print(a .. " world")

print("多行字符串")
s = [[
>关于Hero转会，大概率如下……</div><div class="post-info"><div>24亮 110回复
>【直播】瓶子吃瓜：不用刷Fly了，老林都留队了，飞牛转会的话，我三观都崩了</div><div class="post-info"><div>23亮 48回复
]]
print(s)

s = [===[
function frac(a, b)
    a[b[1]]
]===]
print("多行字符串 规避]]符号")
print(s)

s = "    -3"
print(s)
print("字符串转十进制")
b = tonumber(s)
print(b)


s = "fff "
print(s)
print("字符串转十六进制")
b = tonumber(s, 16)
print(b)

s = "    -7u"
print(s)
print("字符串转十进制  异常值")
b = tonumber(s)
print(b)


s = "hello world"
print("字符串取前5字符 [0, 5]")
ss = string.sub(s, 0, 5)
print(ss)
print("字符串取前5字符 [1, 5]")
ss = string.sub(s, 1, 5)
print(ss)
print("字符串取后5字符 [-5, 0]  异常")
ss = string.sub(s, -5, 0)
print(ss)
print("字符串取后5字符 [-5, -1]")
ss = string.sub(s, -5, -1)
print(ss)

print("长度 ascii")
len = string.len(s)
print(len)


s = "Lua语言程序设计"
print("字符串取前5字符 [0, 5]")
ss = string.sub(s, 1, 5)
print(ss)

print("字符串取前5字符 utf8 [0, 5]")
ss = string.sub(s, 0, utf8.offset(s, 5))
print(ss)

print("获取 第五个utf8字符字节位置")
print(utf8.offset(s, 5), "")


print("长度 ascii")
len = string.len(s)
print(len)

print("长度 utf-8")
len = utf8.len(s)
print(len)

print("逐个打印utf8字符")
for i, c in utf8.codes(s) do
    print(string.format("s[%d] is %d", i, c))
end

print(utf8.codepoint(s, 4, 6))

print(s)
