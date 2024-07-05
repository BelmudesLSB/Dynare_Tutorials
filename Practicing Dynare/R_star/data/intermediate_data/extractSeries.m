function series = extractSeries(folderPath, fileName, start_date, end_date)
    % Construct the full file path
    fullFilePath = fullfile(folderPath, fileName);

    % Read the Excel file with original column headers
    data = readtable(fullFilePath, 'VariableNamingRule', 'preserve');

    % Ensure the 'observation_date' column is in datetime format
    data.observation_date = datetime(data.observation_date, 'InputFormat', 'dd-MMM-yyyy');

    % If end_date is not provided, use the last observation date in the dataset
    if isempty(end_date)
        end_date = max(data.observation_date);
    end

    % Find the rows that match the target date range
    matchingRows = data.observation_date >= start_date & data.observation_date <= end_date;

    % Extract the cells that match the target date
    matchingData = data(matchingRows, :);

    % Extract the series from the second column
    series = matchingData{:, 2}; % Assuming the second column contains the series data
end
