

print(string.format("整数浮点数比较 %d == %.3f", 1, 1.0))
print(1 == 1.0)

a = 1
b = 1 + 0.0
print(a)
print("整数转浮点数")
print(b)

c = b | 0
print("浮点数转整数")
print(c)

c = math.tointeger(a)
print("浮点数转整数")
print(c)

pi = math.pi
print(pi)
a = pi %0.01
print("取余数")
print(a)

b = pi // 1.00
print("整除")
print(b)

a, b = math.modf(pi)
print("同时获取整数与小数部分")
print(a)
print(b)

a = 3.5
print(a)
print("四舍五入")
b = math.floor(a + 0.5)
print(b)

a = 3.499999
print(a)
print("四舍五入")
b = math.floor(a + 0.5)
print(b)

math.randomseed(0)
r = math.random()
print("[0, 1] 随机值")
print(r)
r = math.random(6)
print("1-6 随机整数值")
print(r)

print("浮点数极大值")
print(math.huge)

print("整数表示范围")
print(math.mininteger)
print(math.maxinteger)


print("整数表示范围 十六进制")
print(string.format("min:%x", math.mininteger))
print(string.format("max:%x", math.maxinteger))