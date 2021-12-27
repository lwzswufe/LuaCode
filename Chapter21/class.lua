-- 定义类Account 属性 设置默认值
Account = {balance = 0}
-- 第9行代码的等效用法
-- Account.__index = Account

-- 定义类Account 构造函数
function Account:new(obj)
    obj = obj or {}         --如果用户没有提供则创建一个新的表
    self.__index = self     --定义原型对象的__index元方法 为原型对象自己
    setmetatable(obj, self) --设置实例对象的元表 是原型对象
                            -- obj.__index == self
    print(self)
    print(obj.__index)
    return obj              --返回实例对象
end

function Account:deposit(v) --存入资金
    self.balance = self.balance + v
end


function Account:withdraw(v) --提取资金
    if v > self.balance then --可取资金检查
        error(string.format("balance:%d < v:%d", self.balance, v))
    end
    self.balance = self.balance - v
end


function Account:show()     --显示当前资金
    print("balance:", self.balance)
end


a = Account:new()       -- 不传入表再进行初始化 new函数创建新表
a:deposit(100)
a:show()
a:withdraw(80)
a:show()


b = {name="b"}
print("b.name: ", b.name)
b = Account:new(b)      -- 传入表再进行初始化 表原有内容得到保留
print("b.name: ", b.name)
b:show()
b:deposit(100)
b:show()
b:withdraw(80)
b:show()

