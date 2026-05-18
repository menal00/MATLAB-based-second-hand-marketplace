function filterListings()
   filename = 'userDataLists.mat';
  
   if ~isfile(filename)
       disp('No registered listings found.');
       return;
   end
  
   % Load existData file
   load(filename, 'existData');
  
  
   % Item Name
   searchName = input('Enter item name: ', 's');
   while isempty(searchName) || ~isnan(str2double(searchName))
       if isempty(searchName)
           fprintf('Error: item name is required.\n');
       else
           fprintf('Error: item name should be text, not a number.\n');
       end
       searchName = input('Enter item name: ', 's');
   end
  
   % Category
   allowedCategories = {'Electronics', 'Clothing', 'Furniture', 'Auto Care', 'Automotive', 'Beauty', 'Art'};
   searchCategory = input('Enter category: ', 's');
   while isempty(searchCategory) || ~any(strcmpi(searchCategory, allowedCategories))
       if isempty(searchCategory)
           fprintf('Error: category is required.\n');
       else
           fprintf('Error: Category must be one of: Electronics, Clothing, Furniture, Auto Care, Automotive, Beauty, Art.\n');
       end
       searchCategory = input('Enter category: ', 's');
   end
  
   % Maximum Price
   searchPriceStr = input('Enter maximum price (or leave blank): ', 's');
   while ~isempty(searchPriceStr) && isnan(str2double(searchPriceStr))
       fprintf('Error: maximum price must be a numeric value.\n');
       searchPriceStr = input('Enter maximum price (or leave blank): ', 's');
   end
   if isempty(searchPriceStr)
       maxPrice = Inf;
   else
       maxPrice = str2double(searchPriceStr);
   end
  
   % Condition (mandatory)
   searchCondition = input('Enter condition (Old/Good/Like New/New): ', 's');
   while isempty(searchCondition) || ~isnan(str2double(searchCondition))
       if isempty(searchCondition)
           fprintf('Error: condition is required.\n');
       else
           fprintf('Error: condition should be text, not a number.\n');
       end
       searchCondition = input('Enter condition (New/Fair/Old): ', 's');
   end
  
   % Location (mandatory)
   searchLocation = input('Enter location: ', 's');
   while isempty(searchLocation) || ~isnan(str2double(searchLocation))
       if isempty(searchLocation)
           fprintf('Error: location is required.\n');
       else
           fprintf('Error: location should be text, not a number.\n');
       end
       searchLocation = input('Enter location: ', 's');
   end
  
   % Count criteria
   totalCriteria = 0;
   if ~isempty(searchName),     totalCriteria = totalCriteria + 1; end
   if ~isempty(searchCategory), totalCriteria = totalCriteria + 1; end
   if ~isempty(searchPriceStr), totalCriteria = totalCriteria + 1; end
   if ~isempty(searchCondition),totalCriteria = totalCriteria + 1; end
   if ~isempty(searchLocation), totalCriteria = totalCriteria + 1; end
  
   % --- Filtering and Ranking ---
   matches = [];  % stuct array: listing, score, origIndex.
   matchCount = 0;
   numRows = length(existData); 
  
   for i = 1:numRows
       row = existData{i}; % Each row: {userID, name, phone, location, listing}
       if length(row) < 5
           continue;
       end
      
       listing = row{5};  % Get the listing part out
       score = 0;
       match = true;
      
       % Check item name
       if ~isempty(searchName)
           if contains(lower(listing.name), lower(searchName))
               score = score + 1;
           end
       end
      
       % Check category
       % If the category does not match, listing is automatically a mismatch.
       if ~isempty(searchCategory)
           if strcmpi(listing.category, searchCategory)
               score = score + 1;
           else
               match = false;
           end
       end
      
       % Check price
       if ~isempty(searchPriceStr)
           listingPrice = str2double(listing.price);
           if ~isnan(listingPrice) && listingPrice <= maxPrice
               score = score + 1;
           else
               match = false;
           end
       end
      
       % Check condition
       if ~isempty(searchCondition)
           if strcmpi(listing.condition, searchCondition)
               score = score + 1;
           end
       end
      
       % Check location
       if ~isempty(searchLocation)
           if strcmpi(listing.location, searchLocation)
               score = score + 1;
           end
       end
      
       % Record listing only if match remains true.
       if match && score > 0
           matchCount = matchCount + 1;
           matches(matchCount).listing = listing;
           matches(matchCount).score = score;
           matches(matchCount).origIndex = i;  % Save original index so we could connect to add item to cart function
       end
   end
  
   if matchCount == 0
       fprintf('\nSorry, there are currently no listings that match your preference.\n');
       return;
   end
  
   % Sort the scores
   scores = [matches.score];
   [~, sortIdx] = sort(scores, 'descend');
   sortedMatches = matches(sortIdx);
  
   fprintf('\nTotal matching listings found: %d\n', matchCount);
   for j = 1:matchCount
       fprintf('\nMatch %d (score: %d out of %d):\n', j, sortedMatches(j).score, totalCriteria);
       fprintf('Item Name   : %s\n', sortedMatches(j).listing.name);
       fprintf('Category    : %s\n', sortedMatches(j).listing.category);
       fprintf('Price       : %s\n', sortedMatches(j).listing.price);
       fprintf('Condition   : %s\n', sortedMatches(j).listing.condition);
       fprintf('Location    : %s\n', sortedMatches(j).listing.location);
       if isfield(sortedMatches(j).listing, 'description')
           fprintf('Description : %s\n', sortedMatches(j).listing.description);
       elseif isfield(sortedMatches(j).listing, 'Description')
           fprintf('Description : %s\n', sortedMatches(j).listing.Description);
       end
   end
  
   % --- Add to Cart Section ---
   % user selects a match number from the ranked list
   selectedMatch = input('\nEnter the match number you wish to add to your cart (or 0 to cancel): ');
   if selectedMatch > 0 && selectedMatch <= matchCount
       origIndex = sortedMatches(selectedMatch).origIndex;
       % Call the addItemToCart function with the original index
       addItemToCart(origIndex);
   else
       fprintf('No item added to cart.\n');
   end
end
