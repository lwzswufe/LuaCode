--复数
local M = {}

-- 创建一个新的复数
local function new(r, i)
    return {r=r, i=i};
end

-- 把 new 加入到模块
M.new = new

-- 常量 i
M.i = new(0, 1)

-- 复数加法
function M.add(c1, c2)
    return new(c1.r + c2.r, c1.i + c2.i)
end
-- 返回模块
return M