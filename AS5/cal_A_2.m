function func_A = cal_A_2 

syms wu1 wu2 wu3 wv1 wv2 wv3 s
wu = [wu1 wu2 wu3].';
wv = [wv1 wv2 wv3].';
U = angle_axis_depara( wu );
V = angle_axis_depara( wv );
sigma = deparameterization (s)';
U_vec=U.';
U_vec=U_vec(:);
V_vec=V.';
V_vec=V_vec(:);

tmp11 = kron(eye(3),[-sigma(2)*V(:,2),sigma(1)*V(:,1),...
    (sigma(1)+sigma(2))/2*V(:,3);0,0,-1]);
tmp21 = [kron(eye(3),[sigma(1)*U(1,2),-sigma(2)*U(1,1),(sigma(1)+sigma(2))/2*U(1,3)]);...
    zeros(1,9);...
    kron(eye(3),[sigma(1)*U(2,2),-sigma(2)*U(2,1),(sigma(1)+sigma(2))/2*U(2,3)]);...
    zeros(1,9);...
    kron(eye(3),[sigma(1)*U(3,2),-sigma(2)*U(3,1),(sigma(1)+sigma(2))/2*U(3,3)]);...
    zeros(1,9)];
tmp31 = [U(1,2)*V(:,1)+U(1,3)/2*V(:,3),U(1,3)/2*V(:,3)-U(1,1)*V(:,2);...
    zeros(1,2);...
    U(2,2)*V(:,1)+U(2,3)/2*V(:,3),U(2,3)/2*V(:,3)-U(2,1)*V(:,2);...
    zeros(1,2);...
    U(3,2)*V(:,1)+U(3,3)/2*V(:,3),U(3,3)/2*V(:,3)-U(3,1)*V(:,2);...
    zeros(1,2)];

tmp12 = jacobian(U_vec,wu.');
tmp22 = jacobian(V_vec,wv.');
tmp32 = jacobian(sigma,s);

func_A([wu1 wu2 wu3 wv1 wv2 wv3 s])=[tmp11*tmp12,tmp21*tmp22,tmp31*tmp32];
end