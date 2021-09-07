
s = string.pack("iii", 3, -27, 450)
print(string.format("被打包的字符串长度:%d", #s))

a, b, c, d = string.unpack("iii", s)
print(string.format("被打包的数据:%d %d %d 下一个数据的位置:%d", a, b, c, d))

s = "hello\0Lua\0world\0"
local i = 1
local count = 0
while i <= #s do
    local res
    local start = i
    count = count + 1
    res, i = string.unpack("z", s, i)
    print(string.format("第%d个单词:%s 起始位置:%d 结束位置：%d", count, res, start, i - 1))
end