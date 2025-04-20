function y = hold_top2_peaks_natural(signal, hold_steps, variation_strength)
    y = signal;
    n = length(signal);

    % Find local peaks
    peaks = [];
    for i = 2:n-1
        if signal(i) > signal(i-1) && signal(i) > signal(i+1)
            peaks(end+1) = i; %#ok<AGROW>
        end
    end

    % Get top 2 peaks
    if isempty(peaks), return; end
    [~, sorted_idx] = sort(signal(peaks), 'descend');
    top_peaks = peaks(sorted_idx(1:min(2, end)));

    % Hold the top 2 peak values with small natural variation
    for i = 1:length(top_peaks)
        idx = top_peaks(i);
        end_idx = min(idx + hold_steps - 1, n);
        peak_val = signal(idx);
        
        % Add small noise to simulate natural variation
        noise = randn(1, end_idx - idx + 1) * variation_strength;
        y(idx:end_idx) = peak_val - 2 + noise;
    end
end
