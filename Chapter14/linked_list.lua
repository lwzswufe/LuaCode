function insert(list, node)
    while list.next ~= nil do
        list = list.next
    end
    list.next = node
    -- node->next = nil
end

function print_list(list)
    repeat
        print(string.format("node %d next:%p", list.value, list.next))
        list = list.next
    until list == nil
end

list = {value=1, next=nil}
insert(list, {value=2, next=nil})
insert(list, {value=3, next=nil})

print_list(list)