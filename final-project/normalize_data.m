function out = normalize_data(data)
   out = data - mean(data);
   out = data ./ std(data);
end
