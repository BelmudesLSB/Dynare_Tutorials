/*
 * This file implements a simple RBC model with additively separable utility and TFP news calibrated to US data. It shows how 
 * to generate IRFs to a "pure" news shock where an 8 period anticipated news shock does not materialize at time 0. 
 * This is the type of policy experiment that is for example performed in Beaudry Portier (2004): An exploration  
 * into Pigou’s theory of cycles, Journal of Monetary Economics 51, pp. 1183–1216.
 * This is done using Dynare's simult_ function, which can be used to simulate time series given the decision rules. This capability
 * can be useful if user's want to use a particular shock series (e.g. truncated normal, historical smoothed shocks etc.)
 */

var y c k l z r w invest; //define that the variable invest should be called i in the TeX-file

varexo eps_z_news eps_z_surprise;


parameters beta
    psi 
    sigma 
    delta 
    alpha 
    rhoz 
    gammax 
    n
    x 
    i_y 
    k_y;

% set parameter values
sigma=1;                % risk aversion
alpha= 0.33;            % capital share
i_y=0.25;               % investment-output ration
k_y=10.4;               % capital-output ratio
x=0.0055;               % technology growth (per capita output growth)
n=0.0027;               % population growth
rhoz=0.97;              %technology autocorrelation base on linearly detrended Solow residual

model;
//1. Euler equation
exp(c)^(-sigma)=beta/gammax*exp(c(+1))^(-sigma)* (alpha*exp(z(+1))*(exp(k)/exp(l(+1)))^(alpha-1)+(1-delta));
//2. Labor FOC
psi*exp(c)^sigma*1/(1-exp(l))=exp(w);
//3. Law of motion capital 
gammax*exp(k)=(1-delta)*exp(k(-1))+exp(invest);
//4. resource constraint
exp(y)=exp(invest)+exp(c);
//5. production function
exp(y)=exp(z)*exp(k(-1))^alpha*exp(l)^(1-alpha);
//6. real wage/firm FOC labor
exp(w)=(1-alpha)*exp(y)/exp(l);
//7. annualized real interst rate/firm FOC capital
r=4*alpha*exp(y)/exp(k(-1));
//8. exogenous TFP process
z=rhoz*z(-1)+eps_z_surprise + eps_z_news(-8);
end;

steady_state_model; 
    gammax=(1+n)*(1+x); 
    delta=i_y/k_y-x-n-n*x;  
    beta=gammax/(alpha/k_y+(1-delta)); 
    l_ss=0.33;
    k_ss=((1/beta*gammax-(1-delta))/alpha)^(1/(alpha-1))*l_ss;
    i_ss=(x+n+delta+n*x)*k_ss;
    y_ss=k_ss^alpha*l_ss^(1-alpha);
    c_ss=y_ss-i_ss;
    psi=(1-alpha)*(k_ss/l_ss)^alpha*(1-l_ss)/c_ss^sigma;
    invest=log(i_ss);
    w=log((1-alpha)*y_ss/l_ss);
    r=4*alpha*y_ss/k_ss;
    y=log(y_ss);
    k=log(k_ss);
    c=log(c_ss);
    l=log(l_ss);
    z=0;
end;

shocks;
    var eps_z_news=1; //8 period anticipated TFP news shock
    var eps_z_surprise=1; //TFP surprise shock
end;

steady;
check;

stoch_simul(order=1,irf=40);


