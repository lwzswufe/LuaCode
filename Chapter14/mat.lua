
function print_mat1(mat)
    for row_id = 1, #mat do
        word_list = {}
        row = mat[row_id]
        for col_id = 1, #row do
            table.insert(word_list, string.format("%d", row[col_id]))
        end
        print(table.concat(word_list, ", "))
    end
end

function print_mat2(mat)
    col_n = 0   -- 首先获取列数
    for row_id, row in pairs(mat) do
        word_list = {}
        for col_id, element in pairs(row) do
            col_n = math.max(col_n, col_id)
        end
    end
    print(string.format("columns: %d", col_n))
    for row_id, row in pairs(mat) do
        word_list = {}   -- 逐行打印
        for col_id = 1, col_n do
            if row[col_id] == nil then
                table.insert(word_list, 0)
            else
                table.insert(word_list, string.format("%d", row[col_id]))
            end
        end
        print(table.concat(word_list, ", "))
    end
end

print("矩阵列表初始化")
X = {{1, 2, 3}, {4, 5, 6}}
print_mat1(X)


print("稀疏矩阵初始化")
X = {[1]={[2]=1, [3]=2}, [2]={[2]=1}, [3]={[3]=7}}
print_mat2(X)
