s = "hello world"
i, j = s.find(s, "world")
print(string.format("hello world 里 world的位置 %d~%d", i, j))
i, j = s.find(s, "hello")
print(string.format("hello world 里 hello的位置 %d~%d", i, j))
i, j = s.find(s, "zz")
print(string.format("hello world 里 zz的位置 %s~%s", i or "nil", j or "nil"))
i = 0
count = 0
i, j = s.find(s, "l", i)
while i ~= nil do
    count = count + 1
    print(string.format("hello world 里 第%d 个l的位置 %d~%d", count, i, j))
    i, j = s.find(s, "l", i+1)
    i = j
end

s = "Today is 17/7/1990"
date = string.match(s, "%d+/%d+/%d+")
print(string.format("%s 中的日期是 %s", s, date)) 

s = "Lua is cute"
rs = string.gsub(s, "cute", "great")
print(string.format("把 %s 中的 cute 替换为 great 得到 %s", s, rs))

rs = string.gsub(s, "u", "v", 1)
print(string.format("把 %s 中的第一个 u 替换为 v 得到 %s", s, rs))

s = "$name is $value"
word_table = {name = "Lua"; value = "great"}
rs = string.gsub(s, "$(%w+)", word_table)
print(string.format("把 %s 按照表进行替换得到 %s", s, rs))


function upper(str)
    c = string.byte(str)
    -- d = string.byte("Z")
    if c > string.byte("Z") then
        rstr = string.char(c-32) .. string.sub(str, 2)
        return rstr
        -- print(rstr)
    end
    -- print(c, d)
    return str
end 

s = "Lua is great"
rs = string.gsub(s, "(%w+)", upper)
print(string.format("把 %s 首字母大写转换函数得到 %s", s, rs))