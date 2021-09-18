
function Entry(b)
    print("{")
    for k, v in pairs(b) do
        print(string.format("    %s = %s type = %s", k, v, type(v)))
    end
    print("}")
end

dofile("data2")
