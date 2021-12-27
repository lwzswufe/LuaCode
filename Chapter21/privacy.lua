

-- 工厂函数
function newAccount(name, initialBalance)
    -- 创建变量表
    local self = {balance=initialBalance, name=name}
    -- 支出
    local withdraw = function (v)
                        self.balance = self.balance - v
                     end
    -- 存入
    local deposit = function (v)
                        self.balance = self.balance + v
                    end
    -- 查询现有资金
    local getBalance = function()
                        return self.balance end
    -- 显示资金
    local show = function()
                    print("name: ", self.name, " balance:", self.balance)
                 end
    -- 返回接口表
    return { 
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance, 
        show = show}
    end


a = newAccount("a", 100)
b = newAccount("b", 200)
b.show()
a.show()
a.deposit(10)
a.show()
a.withdraw(99)
a.show()
b.show()





    