-- 定义类Account 属性 设置默认值
Account = {balance = 0}

-- 定义类Account 构造函数
function Account:new(obj)
    obj = obj or {}         --如果用户没有提供则创建一个新的表
    self.__index = self     --定义原型对象的__index元方法 为原型对象自己
    setmetatable(obj, self) --设置实例对象的元表 是原型对象
    return obj              --返回实例对象
end

function Account:deposit(v) --存入资金
    self.balance = self.balance + v
end


function Account:withdraw(v) --提取资金
    if v > self.balance then --可取资金检查
        error(string.format("show balance:%.2f < v:%.2f", self.balance, v))
    end
    self.balance = self.balance - v
end


function Account:show()     --显示当前资金
    -- print("A_show:", self)
    print("A   balance:", self.balance)
end


SpecialAccount = setmetatable({limit=1000}, Account)
SpecialAccount.super = Account
print("Account  :", Account)
print("A__index :", Account.__index)
print("SAmeta   :", getmetatable(SpecialAccount))
print("SA__index:", SpecialAccount.__index)
-- 定义类Account 构造函数
function SpecialAccount:new(limit)
    self.__index = self
    obj = self.super:new()  --父类初始化
    obj.limit = limit
    setmetatable(obj, self)
    return obj              --返回实例对象
end

function SpecialAccount:getLimit()  --获取信用额度
    return self.limit
end

function SpecialAccount:withdraw(v) --提取资金
    if v > self.balance + self:getLimit() then --可取资金检查
        error(string.format("balance:%.2f < v:%.2f + limit:%.2f", self.balance, v, self:getLimit()))
    end
    self.balance = self.balance - v
end

function SpecialAccount:show()     --显示当前资金
    self.super:show()
    -- print("SA_show:", self)
    print("SA  balance:", self.balance, "limit:", self.limit)
end


s=SpecialAccount:new(900)
print("Account  :", Account)
print("SAmeta   :", getmetatable(SpecialAccount))
print("SAccount :", SpecialAccount)
print("SA__index:", SpecialAccount.__index)
print("s_meta   :", getmetatable(s))
print("s__index :", s.__index)

print("SA_limit  :", SpecialAccount.limit)
print("SA_balance:", SpecialAccount.balance)
print("s_limit   :", s.limit)
print("s_balance :", s.balance)
s:show()
s:withdraw(800)
s:show()
s.limit = 1200
s:show()
s:withdraw(395)
s:show()
print("SA_limit  :", SpecialAccount.limit)
print("SA_balance:", SpecialAccount.balance)
print("s_limit   :", s.limit)
print("s_balance :", s.balance)
