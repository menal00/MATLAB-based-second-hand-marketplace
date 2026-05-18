function checkout_Page(index)

% Function: Check Out Page
% prompts user to input info to successfully checkout

load('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter');

fprintf('--------------------------------------------------------------------- \n')
fprintf('------- Check Out Page ---------- \n')

% Prompt user to input their address
userAddress = input('Enter your Address: ','s');

% Validate that the address is not empty
while(isempty(userAddress))
     userAddress = input('\n Please enter a valid address: ', 's');
end

% Prompt user to enter card number
cardNumber = input ('Enter Card Number: ','s');

 % Validate card number: ensure it is not empty and exactly 9 digits long

while(isempty(cardNumber) || ~(length(cardNumber) == 9))
    fprintf('The Card number you have entered is invalid, Please input a valid Card number.\n');
     cardNumber = input('\n Please enter a 9 digit Card Number: ', 's');
end




year = 25:35;

month = 1:12;


% prompt user to enter the expired month and year of the card

userMon = input("Please enter the expired month ");
userYear = input("Please enter the expired Year ");


% validate the month and the year

while ~ismember(userMon, month) || ~ismember(userYear, year)
    if ~ismember(userMon, month)
        userMon = input('Please enter a valid month: ');
    end
    if ~ismember(userYear, year)
        userYear = input('Please enter a valid year: ');
    end
end


% Prompt user to enter ccv code & validate it 
userCCV = input("Please enter your CCV ", 's');

while((length(userCCV)) ~= 3)
userCCV = input("Please enter valid 3 digit CCV ");
end



    % Prompt user for payment confirmation
       cardConfirmation = input('Confirm Payment (Y/N) for the item below \n', 's');
        disp(cart{index}{5})

   % Validate the user input for confirmation
    while (~isempty(cardConfirmation))  
       if strcmpi(cardConfirmation, 'y')
           fprintf('You have successfully completed!');

           % remove the item from the data and cart 
            user = findUser(cart{index}{1});
            cart{index} = [];
            cartCounter = cartCounter - 1;
            existData{user}{5} = [];
           break;
           
       elseif strcmpi(cardConfirmation, 'n') 
           fprintf('Payment Cancelled');
           break;
       else
           fprintf('Please enter a valid input.');
           cardConfirmation = input('\n Confirm Payment (Y/N)', 's');
       end

    end

    % save the update in the data 
    save('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter')

end
