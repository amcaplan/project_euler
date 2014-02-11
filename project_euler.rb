class Integer
	def is_prime(list = false)
	    if list
	    	list.each { |prime|
	    		return false if self % prime == 0
	    	}
	    	true
	    else
		    for i in 2..(Math.sqrt(self)) do
		        return false if self % i == 0
		    end
		    true
		end
	end

	def is_palindrome
		num_str = self.to_s
		return num_str == num_str.reverse
	end

	def is_divis(num)
		while num > 1
			return false if self % num != 0
			num -= 1
		end
		true
	end
end

def problem3
	bignum = 600851475143
	i = 2

	while i < bignum/2
		if bignum % i == 0 && i.is_prime
			bignum /= i
			break if bignum.is_prime
		end
		i += 1
	end
	"Here is the largest prime factor: #{bignum}"
end

def problem4
	all_pals = []
	for i in 100...1000 do
		for j in 100...1000 do
			mult = i * j
			all_pals << mult if mult.is_palindrome
		end
	end

	biggest_pal = 0
	all_pals.each { |pal|
		biggest_pal = pal if pal > biggest_pal
	}
	biggest_pal
end

def problem5
	# use all prime factors
	2*3*2*5*7*2*3*11*13*2*17*19
end

def problem6
	sum_sq = 0
	sq_sum = 0
	(1..100).each { |num|
		sum_sq += num**2
		sq_sum += num
	}
	sq_sum = sq_sum ** 2
	puts sum_sq
	puts sq_sum
	sq_sum - sum_sq
end

def problem7
	prime_count = 0
	i = 2
	while prime_count < 10_001
		prime_count += 1 if i.is_prime
		i += 1
		puts prime_count
	end
	puts i-1
end

def problem8
	bignum = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
	prod = 0
	for i in 0..995
		cur_prod = 1
		(0..4).each {|j|
			cur_prod *= bignum[i+j].to_i
		}
		prod = cur_prod if cur_prod > prod
	end
	prod
end

def problem9
	(1...1000).each do |a|
		(1...1000).each do |b|
			if a + b < 1000
				(1...1000).each do |c|
					if a + b + c == 1000 && a**2 + b**2 == c**2
						puts "#{a}, #{b}, #{c}"
						puts a*b*c
					end
				end
			end
		end
	end
end

def problem10
	two_mil_nums = [0]
	(1...2_000_000).each { |i|
		two_mil_nums[i] = i
	}
	two_mil_nums[1] = 0
	counter = 2
	while counter < two_mil_nums.length
		if two_mil_nums[counter] != 0
			i = counter * 2
			while i < two_mil_nums.length
				two_mil_nums[i] = 0
				i += counter
			end
		end
		counter += 1
	end
	sum = 0
	two_mil_nums.each { |num|
		sum += num
	}
	puts sum
end

def problem11
  nums = ["08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08",
    "49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00",
    "81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65",
    "52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91",
    "22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80",
    "24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50",
    "32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70",
    "67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21",
    "24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72",
    "21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95",
    "78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92",
    "16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57",
    "86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58",
    "19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40",
    "04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66",
    "88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69",
    "04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36",
    "20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16",
    "20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54",
    "01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"]
  nums.map!{|string| string.split.map(&:to_i)}
  directions = [[0,1],[1,0],[1,1],[1,-1]]
  biggest_prod = 0
  directions.each do |dir|
    new_prod = check_dir(nums, dir)
    biggest_prod = new_prod if new_prod > biggest_prod
  end
  puts "The biggest product: #{biggest_prod}"
end

def check_dir(nums, dir)
  biggest = 0
  nums.each_with_index do |row_set, row|
    row_set.each_with_index do |num, col|
      (0..3).each do |int|
        row_start = row - int
        col_start = col - int
        if nums[row_start] && nums[row_start][col_start] && nums[row_start+dir[0]*3] && nums[row_start+dir[0]*3][col_start+dir[1]*3]
          product = nums[row_start+dir[0]*0][col_start+dir[1]*0]*
                    nums[row_start+dir[0]*1][col_start+dir[1]*1]*
                    nums[row_start+dir[0]*2][col_start+dir[1]*2]*
                    nums[row_start+dir[0]*3][col_start+dir[1]*3]
          biggest = product if product > biggest
        end
      end
    end
  end
  biggest
end

puts problem11

def problem12
  def generate_triangle_nums
    Enumerator.new do |yielder|
      i = 0
      tri_num = 0
      loop do
        i += 1
        tri_num += i
        yielder.yield tri_num
      end
    end
  end

  def is_triangle_num?(num, tri_num_gen)
    tri_num_gen.each do |tri_num|
      return true if tri_num == num
      return false if tri_num > num
    end
  end

  tri_num_gen = generate_triangle_nums



  def factors(num)
    puts "checking factors for #{num}"
    fax = (1..num/2).select{|factor| num % factor == 0} << num
    puts "#{fax.size} factors found."
    fax
  end

  def within_1000_tris(tri_num_gen)
    i = 1000
    last_num = within_100_000_tris
    tri_num_gen.each do |num|
      i += 1
      if i > 1000
        return last_num if factors(num).size >= 500
        i = 0
        last_num = num
      end
    end
  end

  def within_100_000_tris
    tri_num_gen = generate_triangle_nums
    i = 100_000
    last_num = 1
    tri_num_gen.each do |num|
      i += 1
      if i > 100_000
        return last_num if factors(num).size >= 500
        i = 0
        last_num = num
      end
    end
  end

  tri_num_gen = generate_triangle_nums
  close_num = within_1000_tris(tri_num_gen)
  tri_num_gen = generate_triangle_nums
  tri_num_gen.each do |num|
    if num > last_num
      return num if factors(num).size >= 500
    end
  end
end

puts problem12