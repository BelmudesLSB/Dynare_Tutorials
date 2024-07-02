function ds = dynamic_set_auxiliary_series(ds, params)
%
% Computes auxiliary variables of the dynamic model
%
ds.AUX_ENDO_LAG_0_1=ds.pi(-1);
ds.AUX_ENDO_LAG_0_2=ds.AUX_ENDO_LAG_0_1(-1);
end
