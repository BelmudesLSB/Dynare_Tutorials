var c1 c2 k1 k2 a1 a2 y1 y2;

varexo e1 e2;

parameters gamma delta alpha beta rho;

varobs y1 y2;

gamma=2;
delta=.05;
alpha=.4;
beta=.98;
rho=.85;

model;
c1=c2;
exp(c1)^(-gamma) = beta*exp(c1(+1))^(-gamma)*(alpha*exp(a1(+1))*exp(k1)^(alpha-1)+1-delta);
exp(c2)^(-gamma) = beta*exp(c2(+1))^(-gamma)*(alpha*exp(a2(+1))*exp(k2)^(alpha-1)+1-delta);
exp(c1)+exp(c2)+exp(k1)-exp(k1(-1))*(1-delta)+exp(k2)-exp(k2(-1))*(1-delta) = exp(a1)*exp(k1(-1))^alpha+exp(a2)*exp(k2(-1))^alpha;
a1=rho*a1(-1)+e1;
a2=rho*a2(-1)+e2;
exp(y1)=exp(a1)*exp(k1(-1))^alpha;
exp(y2)=exp(a2)*exp(k2(-1))^alpha;
end;

shocks;
var e1; stderr .08;
var e2; stderr .08;
end;

steady;

check;

stoch_simul(irf=0,order=1, graph_format=pdf);
calib_smoother(datafile=simu2);
