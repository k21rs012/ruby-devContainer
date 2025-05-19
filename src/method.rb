def max x, y
  if x > y
    # return x
    # result = x
    x
  else
    # return y
    # result = y
    y
  end
end

# 整数を一つ受け取って、偶数なら"even"、奇数なら"odd"という文字列を返すevenOddというメソッドを宣言
# 引数5でevenOddを呼び出して、その返り値を表示
# 引数100でevenOddを呼び出して、その返り値を表示

def evenOdd n
  if n % 2 == 0
    "even"
  else
    "odd"
  end
end


a = 5
b = 10
c = max(a, b)
puts c


q = evenOdd(5)
r = evenOdd(100)
puts q
puts r