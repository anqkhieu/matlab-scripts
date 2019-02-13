function [possibilities] = possibleForSquare(puzzle, index1, index2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Possible for Square
%
% Fills out an array of possible values that can go in the square at 
% (index1, index2) for the sudoku puzzle, puzzle.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT:
% puzzle - the 9 x 9 array that represents the whole puzzle
% index1 - the row index of the square
% index2 - the column index of the square
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OUTPUT:
% possibilities - an array of all the possible entries for given square.
% Should obey the row, column, and square rules of the puzzle. If none of
% the values are possible return an empty array.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TODO: complete the algorithm
% Preliminary checks
% * Check to make sure that the puzzle is not already filled in

% Begin constructing all possibilities for  a square
% * Initialize all possibilities
% * Check the row
% * Check the column
% * Check the box
% * Throw out any numbers found from the list of possiblities

    if all(puzzle ~= 0)
        possibilities = [];
    else 
        possibilities = 1:9;
        
        % check row
        rowElements = puzzle(index1,:);
        for colIndex = 1:length(rowElements)
            comparedValue = puzzle(index1, colIndex);
            if length(find(possibilities == comparedValue)) >= 1    
                indexDelete = find(possibilities == comparedValue);
                possibilities(indexDelete) = [];
            end
        end
        
        % check column
        colElements = puzzle(:,index2);
        for rowIndex = 1:length(colElements)
            comparedValue = puzzle(rowIndex, index2);
            if length(find(possibilities == comparedValue)) >= 1    
                indexDelete = find(possibilities == comparedValue);
                possibilities(indexDelete) = [];
            end
        end
        
        % check box
        [rowN,colN] = size(puzzle);
        numSqR = rowN/3
        numSqC = colN/3
        iR = 1;
        iC = 1;
        puzzlePortions = cell(0);
            % make boxes
        for r = 1:numSqR
            for c = 1:numSqC 
                puzzlePortions{end+1} = puzzle(iR:iR+2, iC:iC+2);
                iC = iC+3;
            end
            iC = 1;
            iR = iR+3;
        end        
            % find box of coordinate
            ppIndex = (floor((index1-1)/3)*(numSqR)) + ceil(index2 / 3);
            
            % elimination for possibilities based off box values
        pPortion = puzzlePortions{ppIndex};  
            for iPSq = 1:9
                comparedValue = pPortion(iPSq);
                if length(find(possibilities == comparedValue)) >= 1    
                    indexDelete = find(possibilities == comparedValue);
                    possibilities(indexDelete) = [];
                end
            end
        
    end
    if puzzle(index1, index2) ~= 0
       possibilities = puzzle(index1, index2) 
    end
end