
-- 从 foo.lua 文件里加载函数
-- assert 检查调用结果
f = assert(loadfile("/home/wiz/LuaCode/Chapter16/foo.lua"), "error in loadfile")
print("type f: ", type(f))
print("type foo: ", type(foo))  -- 此时foo尚未定义
f()                             -- 运行加载代码
print("type foo: ", type(foo))  -- 加载函数foo
foo(16)                         -- 调用函数foo
foo("s")