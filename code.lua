-- guess the code 

math.randomseed( tonumber(tostring(os.time()):reverse():sub(1,6))  ) 
math.random() -- magic 

code = {} 
for i = 1,4 do 
        code[i] = math.random(6) 
end 
-- code = {5,1,1,2} 
-- print("DEBUG: CODE: " .. table.concat(code)) 

io.write"Guess the code - four positions, 1 to 6 each.\n" 

no = 1 
guess = {} 
while(no <= 12 and table.concat(guess) ~= table.concat(code)) do 
        io.write("Your guess #" .. no .. ": ") 
        input = io.read"*l" 
        input = input:sub(1, 4) -- cut of if user inputs longer code 
        for i = 1, #input do 
                guess[i] = tonumber(input:sub(i, i)) 
        end 
        hit = 0 
        off = 0 
        miss = {} 
        for i = 1, #guess do 
                if guess[i] == code[i] then -- pos & value correct 
                        hit = hit + 1 
                else 
                        for j = 1, #code do 
                                if i ~= j and guess[i] == code[j] and guess[j] ~= code[j] then 
                                        -- val oresen at other pos and no hit 
                                        off = off + 1 
                                end 
                        end 
                end 
                -- print("Pos",i,"code", code[i], "guess", guess[i], "hit", hit, 'off', off) 
        end 
        io.write("You guessed " .. hit .. " positions plus " .. off .. " values correctly.\n") 
        no = no + 1 
end 

if table.concat(guess) ~= table.concat(code) then 
        io.write("Sorry you failed. Code was: " .. table.concat(code) .. ".\n"); 
else 
        io.write"Congratulations, you broke the code!\n" 
end
