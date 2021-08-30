function print_date(date)
    for k, v in pairs(date) do
        if type(v) == "number" then
            print(string.format("%s = %d", k, v))
        else
            print(string.format("%s = %s", k, v and "true" or "false"))
        end
    end
end

print(string.format("自1970年1月1日以来的秒数 %d", os.time()))


d = {year=2020, month=12, day=30}
print(string.format("自1970年1月1日到2020年12月30日的秒数 %d", os.time(d)))

d = {year=2020, month=12, day=30, hour=12}
print(string.format("自1970年1月1日到2020年12月30日12时的秒数 %d", os.time(d)))
print("小时数默认值为12")
print("时间戳转结构体")
print(os.time(d))
print("结构体转时间戳")
date = os.date("*t", os.time(d))
print_date(date)
print("时间戳转字符串")
print(os.date("%Y-%m-%d %H:%M:%S", os.time()))

date = os.date("*t")
print("当前时间")
print_date(date)
print(os.date("当前日期 %Y-%m-%d", os.time(date)))
date_40 = date
date_40.day = date_40.day + 40
print(os.date("四十天后 %Y-%m-%d", os.time(date_40)))
date = os.date("*t")
diff = os.difftime(os.time(date_40), os.time(date))
print(string.format("时间差:%.2f 天数:%d", diff, diff//86400))

time_st = os.clock()
print(string.format("当前时刻:%.6f", time_st))

for i=1, 1000000000 do
    j = i
end

time_ed = os.clock()
print(string.format("当前时间:%.6f 使用时间:%.6fs", time_ed, time_ed - time_st))

