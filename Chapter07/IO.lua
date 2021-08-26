function read_1(filename)
    print("filename:", filename)
    local file = io.open(filename, "r")
    if nil == file then
        print(string.format("open file %s fail", filename))
        return
    else
        print(string.format("open file %s success", filename))
    end
    local lines = {}
    while true do
        line = file:read("L")   -- 含换行符
        if line ~= nil then
            table.insert(lines, line)
        else 
            break
        end
    end
    return lines
end

function read_2(filename)
    print("filename:", filename)
    local iter = io.lines(filename)
    if nil == iter then
        print(string.format("open file %s fail", filename))
        return
    else
        print(string.format("open file %s success", filename))
    end
    local lines = {}
    for line in iter do  -- 不含换行符
        table.insert(lines, line)
    end
    return lines
end


function write(filename, lines)
    local file = io.open(filename, "w")
    if nil == file then
        print(string.format("open file %s fail", filename))
        return
    else
        print(string.format("open file %s success", filename))
    end
    for i = 1, #lines do
        file:write(lines[i])
    end
end

lines = read_1("/home/wiz/LuaCode/Chapter07/a.txt")
write("/home/wiz/LuaCode/Chapter07/b1.txt", lines)

lines = read_2("/home/wiz/LuaCode/Chapter07/a.txt")
write("/home/wiz/LuaCode/Chapter07/b2.txt", lines)