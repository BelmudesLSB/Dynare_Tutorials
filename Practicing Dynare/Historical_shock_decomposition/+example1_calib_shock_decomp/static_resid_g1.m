function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
% function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = example1_calib_shock_decomp.static_g1_tt(T, y, x, params);
    end
    residual = example1_calib_shock_decomp.static_resid(T, y, x, params, false);
    g1       = example1_calib_shock_decomp.static_g1(T, y, x, params, false);

end
