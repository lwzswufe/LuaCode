local count = 0
function Entry(b)
    count = count + 1
    print("{")
    for i = 1, #b do
        print("    " .. b[i])
    end
    print("}")
end
dofile("data1")
print("number of entries: " .. count)