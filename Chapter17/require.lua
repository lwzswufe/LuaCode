-- 加载模块
local m = require "math"    
print("sin(pi/4): ", m.sin(m.pi/4))
-- 加载模块里的指定函数
local format = require "string".format
print(format("sin(pi/4): %.4f", m.sin(m.pi/4)))
-- 输出当前已加载包
for k, v in pairs(package.loaded) do
    print(k, v)
end
-- 输出当前包加载路径
print(package.path)
-- 获取当前文件路径
local info = debug.getinfo(1,'S')
print("current file: ", info.source)
local idx = string.find(string.reverse(info.source), "/")
print("current file dir: ", string.sub(info.source, 2, -idx))
local curfile_path = string.sub(info.source, 2, -idx)
-- 获取工作路径
dir = os.getenv("PWD")
print(dir)
-- 添加当前文件路径到 lua模块加载路径
package.path = package.path..";"..curfile_path.."?.lua"
print(package.path)
-- 加载用户自定义模块
local cpx = require "complex"
print("type cpx: {}", type(cpx))
c1 = cpx.new(1, 2)
c2 = cpx.new(2, 3)
c3 = cpx.add(c1, c2)
print(string.format("c3: %.2f %.2fi", c3.r, c3.i))
