local f =assert(io.open("dump.lua", "rb"))
local blocksize = 16
for bytes in f:lines(blocksize) do    -- 每次读取blocksize个字符
    for i = 1, #bytes do              -- 对每一个字符
        local b = string.unpack("B", bytes, i)
        io.write(string.format("%02X ", b))
    end
    io.write(string.rep("   ", blocksize - #bytes))  -- 不足blocksize个字符的情况下 对每个缺失字符补充三个空白符号
    bytes = string.gsub(bytes, "%c", " ")  -- 将 控制字符 替换为 空白字符
    io.write(" ", bytes, "\n")
end