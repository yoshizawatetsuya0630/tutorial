
def houjinzeitou_total(income, kihukin)

    houjinzei = calc_houjinzei(income,kihukin)
    chihou_houjinzei = calc_chihouhoujinzei(income, kihukin)
    juuminzei = calc_juuminzei(income, kihukin)
    houjin_jigyouzei = calc_jigyouzei(income, kihukin)
    tokubetu_jigyouzei = calc_sp_jigyouzei(income, kihukin)


    houjinzei +  chihou_houjinzei + juuminzei + houjin_jigyouzei + tokubetu_jigyouzei
end

def calc_houjinzei(income, kihukin)
    kokuzei = (income - kihukin -8_000_000) * 0.232
    keigen_kokuzei = 8_000_000 * 0.15
    kokuzei + keigen_kokuzei    
end

def calc_chihouhoujinzei(income, kihukin)
    houjinzei = calc_houjinzei(income, kihukin)
    (houjinzei * 0.103).floor(-2)
end


def calc_juuminzei(income, kihukin)
    houjinzei = calc_houjinzei(income, kihukin)
    if houjinzei >= 10_000_000
        houjinzei * 0.104
    else
        houjinzei * 0.07
    end
end

def calc_jigyouzei(income, kihukin)
    jigyouzei = (income - kihukin) * 0.0748
end

def calc_sp_jigyouzei(income, kihukin)
    calc_jigyouzei(income, kihukin) * 0.37
end



def kihukin_koujo(income, kihukin)
    koujo1 = calc_koujo1(income, kihukin)
    koujo2 = calc_koujo2(income, kihukin)
    koujo3 = calc_koujo3(income, kihukin)

    koujo1 + koujo2 + koujo3
end

def calc_koujo1(income, kihukin)
    juuminzeibun = [calc_juuminzei(income, kihukin) * 0.2, kihukin * 0.4]
    juuminzeibun.min
end

def calc_koujo2(income, kihukin)
    houjinzeibun = [(calc_houjinzei(income, kihukin)+ calc_chihouhoujinzei(income, kihukin)) * 0.05, kihukin * 0.1, (kihukin * 0.4 - calc_juuminzei(income, kihukin))]
    houjinzeibun.min
end

def calc_koujo3(income, kihukin)
    jigyouzeibun = [calc_jigyouzei(income, kihukin) * 0.2, kihukin * 0.2]
    jigyouzeibun.min
end

sonkin_kouka = houjinzeitou_total(100_000_000, 0) - houjinzeitou_total(100_000_000, 20_000_000)
jiko_hutangaku = 20_000_000 - kihukin_koujo(100_000_000, 20_000_000) - sonkin_kouka
jiko_hutan_wariai = jiko_hutangaku / 20_000_000 * 100

puts "法人税等合計　#{houjinzeitou_total(100_000_000, 20_000_000).round}"
puts "寄付金控除額合計 #{kihukin_koujo(100_000_000, 20_000_000).round}"
puts "損金算入効果 #{sonkin_kouka.round}"
puts "自己負担額 #{(jiko_hutangaku).round}"
puts "自己負担割合 #{(jiko_hutan_wariai).round(2)}%"
puts "git test"
puts "git test2"
