--获取命令行参数 使用全局变量arg
for i=-1, 2 do
    print(string.format("arg[%d]:%s", i, arg[i]))
end